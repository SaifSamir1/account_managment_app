import 'package:account_managment/core/utils/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../domain/repositrise/auth_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(LoginInitialState());

  final AuthRepo authRepo;

  var emailControllerLogin = TextEditingController();
  var passwordControllerLogin = TextEditingController();



  bool isPasswordShow = true;
  IconData suffix = Icons.visibility_outlined;


  void ChangePasswordVisiability()
  {
    isPasswordShow = !isPasswordShow;

    suffix = isPasswordShow ? Icons.visibility_outlined:Icons.visibility_off_outlined ;

    emit(ChangePasswordVisibilityState());
  }

  Future<void> loginWithCompleteInformation(
      String emailAddress, String password) async {
    emit(LoginWithCompleteInformationLoadingState());

    var result = await authRepo.loginWithCompleteInformation(
      emailAddress,
      password,
    );
    result.fold((error) {
      print(error.toString());
      emit(LoginWithCompleteInformationErrorState(error.toString()));
    }, (credential) {
      userId8 = credential.user!.uid;
      emit(LoginWithCompleteInformationSuccessState(credential.user!.uid));
    });
  }


  bool isInfoComplete = false;

  void infoComplete({required String password,required String email}) {

    if (email.isNotEmpty && password.isNotEmpty) {
      isInfoComplete = true;
      emit((LoginChangeBottomColorSuccessState()));
    } else {
      isInfoComplete =false;
      emit((LoginChangeBottomColorErrorState()));
    }
  }


  Future<void> loginWithGoogle() async {
    emit(LoginWithGoogleLoadingState());

    var result = await authRepo.signUpWithGoogle();

    result.fold((failure) {
      emit(LoginWithGoogleErrorState());
    }, (right) {
      emit(LoginWithGoogleSuccessState());
    });
  }



  void awesomeDialog({
    required String desc,
    required context,
    required DialogType dialogType,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: 'Dialog Title',
      desc: desc,
    )..show();

    emit(LoginAwesomeDialogState());
  }

  Future<void> pushAndEnd(context, String theNextScreen) async {
    await authRepo
        .pushAndEnd(context, theNextScreen)
        .then((value) {
          emit(PushSuccessState());
    })
        .catchError((onError){
          print( onError.toString());
      emit(PushErrorState());

    });
  }



}
