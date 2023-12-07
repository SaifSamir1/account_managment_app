import 'package:account_managment/core/utils/app_router.dart';
import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/featuers/splash_view/presentation/views/widgets/sliding_text_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
          width: SizeConfig.defaultSize! * 40,
            height: SizeConfig.defaultSize! * 40,
            child: Image.asset(AssetsData.splash2)),
        const SizedBox(height: 30),
         Text('مرحبااا',style: TextStyle(
          fontSize: 30,
          color: defaultColor,
          fontWeight: FontWeight.bold,
        ),),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
            child: SlidingTextAnimated(slidingAnimation: slidingAnimation))
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        //ال duration هنا بيقولك ال animation ده هياخد قد ايه علشان يخلص
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationController.forward();

    slidingAnimation = Tween<Offset>(
      begin:  Offset( 0 , 8 ),
      end: Offset.zero,
    ).animate(animationController);
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if(notShowAuthScreenKey=='true'){
        GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen);
      }else{
        GoRouter.of(context).pushReplacement(AppRouter.kAuthScreen);
      }
    });
  }
}
