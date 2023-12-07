






import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/widgets.dart';

class NewPasswordRecoverySucceededScreen extends StatelessWidget {
  const NewPasswordRecoverySucceededScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            const SizedBox(
                height:150,
                width: 150,
                child: Image(
                  image: AssetImage(AssetsData.checkmark),
                )),
            const Text(
              'Success',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:  60.0),
              child: Text(
                'Congratulations your password has been changed,',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff6B7280)
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            customForgetPasswordBottom(
                onPressed: ()
                {
                  GoRouter.of(context).push(AppRouter.kAuthScreen);
                },
                text: 'Sign in',
                colorBottom: defaultColor,
                textColor: Colors.white),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
