import 'package:account_managment/core/utils/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/hive_service.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../manger/auth_screen_cubit/signup_cubit/signup_cubit.dart';
import '../../manger/auth_screen_cubit/signup_cubit/signup_states.dart';
import 'custom_create_account_text_field.dart';

class CreateAccountScreenBody extends StatelessWidget {
   const CreateAccountScreenBody({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);

    return BlocListener<SignUpCubit,SignUpStates>(
          listener: (BuildContext context, state) {
            if(state is SignUpWithCompleteInformationErrorState){
              signUpCubit.awesomeDialog(
                context:context,
                desc: state.errMessage,
                dialogType: DialogType.error,
              );
            }
            if(state is SignUpStoreTheUserInformationSuccessState){
              signUpCubit.awesomeDialog(
                  context:context,
                  desc: 'تم انشاء حساب بنجاح',
                  dialogType: DialogType.success,
              );
              myBox!.put('notShowAuthScreen', 'true');
              Future.delayed(const Duration(seconds: 5),()
              {
                signUpCubit.pushAndEnd(context, AppRouter.kHomeScreen);
              });
            }
          },
          child: BlocBuilder<SignUpCubit,SignUpStates>(
            builder: (BuildContext context, state) {
              var formKey = GlobalKey<FormState>();
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    const CustomCreateAccountTextField(),
                    ConditionalBuilder(
                        condition: state is! SignUpWithCompleteInformationLoadingState,
                        builder: (context) => defaultButton(
                            googleImage: false,
                            onPressedFunction: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                signUpCubit.signUpWithCompleteInformation(
                                  name:signUpCubit.nameControllerReg.text ,
                                    countryName: signUpCubit.countryNameControllerReg.text,
                                    emailAddress:  signUpCubit.emailControllerReg.text,
                                    password:signUpCubit.passwordControllerReg.text).then((value) {
                                  signUpCubit.nameControllerReg.clear();
                                  signUpCubit.emailControllerReg.clear();
                                  signUpCubit.passwordControllerReg.clear();
                                  signUpCubit.countryNameControllerReg.clear();
                                });
                              }

                            },
                            backGroundColor:defaultColor,
                            height: 49,
                            text: 'انشاء حساب',
                            textColor:  Colors.white,
                            width: 256,
                            isUpperCase: false),
                      fallback:(context) => const Center(child: CircularProgressIndicator()),
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
            },
          ),
        );
      }
}

