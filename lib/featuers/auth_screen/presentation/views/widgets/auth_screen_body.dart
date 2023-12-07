






import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../manger/auth_screen_cubit/auth_screen_cubit.dart';
import '../../manger/auth_screen_cubit/auth_screen_states.dart';
import 'auth_image_and_texts.dart';
import 'build_sheet.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenCubit,AuthScreenStates>(
      builder: (BuildContext context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AuthImageAndTexts(),
                defaultButton(
                    googleImage: false,
                    isUpperCase: false,
                    width: 257,
                    onPressedFunction: ()
                    {
                      BlocProvider.of<AuthScreenCubit>(context).currentIndex = 0;
                      showModelBottomSheet(context);
                    },
                    backGroundColor: defaultColor,
                    height: 49,
                    text: 'انشاء حساب',
                    textColor: Colors.white

                ),
                SizedBox(height: SizeConfig.defaultSize! * 3.8,),
                defaultButton(
                  googleImage: false,
                  isUpperCase: false,
                  width: 257,
                  onPressedFunction: ()
                  {
                    BlocProvider.of<AuthScreenCubit>(context).currentIndex=1;
                    showModelBottomSheet(context);
                  },
                  backGroundColor: defaultColor.withOpacity(.2),
                  height: 49,
                  text: 'تسجيل الدخول',
                  textColor: defaultColor,
                ),
                SizedBox(height: SizeConfig.defaultSize! * 3.8,),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                isDismissible: true,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(36))
                  ),
                  context: context,
                  builder: (BuildContext context)
                  {
                    return const BuildSheet();
                  }
              );
  }
}


