import 'package:account_managment/core/utils/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/hive_service.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../manger/auth_screen_cubit/login_cubit/login_cubit.dart';
import '../../manger/auth_screen_cubit/login_cubit/login_states.dart';
import 'custom_login_text_field.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        var loginCubit= BlocProvider.of<LoginCubit>(context);
        if (state is LoginWithCompleteInformationErrorState) {
          loginCubit.awesomeDialog(
            context: context,
            desc: state.errorMessage,
            dialogType: DialogType.error,
          );
        }
        if (state is LoginWithCompleteInformationSuccessState) {
          loginCubit.awesomeDialog(
              context: context,
              desc: 'تم تسجيل الدخول بنجاح',
              dialogType: DialogType.success,);
          Future.delayed(const Duration(seconds: 5),(){
            loginCubit.pushAndEnd(context, AppRouter.kHomeScreen);
          });
          myBox!.put('notShowAuthScreen', 'true');
        }
      },
      child: BlocBuilder<LoginCubit, LoginStates>(
          builder: (BuildContext context, state) {
        var formKey = GlobalKey<FormState>();
        var loginCubit= BlocProvider.of<LoginCubit>(context);
        return Form(
          key: formKey,
          child: Column(
            children: [
              const CustomLoginTextField(),
              ConditionalBuilder(
                condition: state is! LoginWithCompleteInformationLoadingState,
                builder: (context) => defaultButton(
                    googleImage: false,
                    onPressedFunction: () {
                      if (formKey.currentState!.validate()) {
                        loginCubit
                            .loginWithCompleteInformation(
                          loginCubit
                              .emailControllerLogin
                              .text,
                          loginCubit
                              .passwordControllerLogin
                              .text,
                        ).then((value) {
                          loginCubit.emailControllerLogin.clear();
                          loginCubit.passwordControllerLogin.clear();
                        });
                      }
                    },
                    backGroundColor:defaultColor,
                    height: 49,
                    text: 'تسجيل الدخول',
                    textColor: Colors.white,
                    width: 256,
                    isUpperCase: false),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 280,
              ),
            ],
          ),
        );
      }),
    );
  }
}
