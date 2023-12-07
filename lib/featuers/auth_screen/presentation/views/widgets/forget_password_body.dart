import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../manger/auth_screen_cubit/forget_password_cubit/forget_password_cubit.dart';
import '../../manger/auth_screen_cubit/forget_password_cubit/forget_password_states.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (BuildContext context, state) {
        final forgetPasswordCubit =
        BlocProvider.of<ForgetPasswordCubit>(context);
        if(state is ResetPasswordAndSendItToMyEmailSuccessState)
          {
            GoRouter.of(context).pushReplacement(AppRouter.kPasswordRecoverySucceededScreen);
          }
        if(state is ResetPasswordAndSendItToMyEmailErrorState)
        {
          forgetPasswordCubit.awesomeDialog(
            desc: state.errorMessage,
            context: context,
            dialogType: DialogType.error,
          );
        }
      },
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
        builder: (BuildContext context, state) {
          final forgetPasswordCubit =
              BlocProvider.of<ForgetPasswordCubit>(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 11,
                ),
                const Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'ادخل البريد الالكتروني',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff9CA3AF),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'ادخل البريد الالكتروني',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DefultTextForm(
                    controller: emailController,
                    keyBoardType: TextInputType.emailAddress,
                    hintText: 'Eg namaemail@emailkamu.com',
                    valedate: (value) {
                      if (value!.isEmpty) {
                        return 'البريد الالكتروني لا يجب ان يكون فارغا';
                      }
                      return null;
                    },
                    onChange: (value) {
                      forgetPasswordCubit
                          .changeColorOfBottomF(emailController.text);
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      const Text(
                        'هل تذكرة كلمة السر',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff9CA3AF),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            GoRouter.of(context).pushReplacement(AppRouter.kAuthScreen);
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 14,
                              color: defaultColor,
                            ),
                          ))
                    ],
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: SizedBox(),
                ),
                Center(
                  child: customForgetPasswordBottom(
                    onPressed: () {
                      forgetPasswordCubit.resetPasswordAndSendItToMyEmail(
                          email: emailController.text);
                    },
                    text: 'تاكيد',
                    colorBottom: forgetPasswordCubit.changeColorOfBottom
                        ? defaultColor
                        : const Color(0xffF4F4F4),
                    textColor: forgetPasswordCubit.changeColorOfBottom
                        ? Colors.white
                        : const Color(0xff9CA3AF),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
