import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/featuers/auth_screen/presentation/manger/auth_screen_cubit/signup_cubit/signup_states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../domain/repositrise/auth_repo.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.authRepo) : super(SignUpInitialState());

  final AuthRepo authRepo;

  var nameControllerReg = TextEditingController();
  var emailControllerReg = TextEditingController();
  var passwordControllerReg = TextEditingController();
  var countryNameControllerReg = TextEditingController();

  bool isInfoComplete = false;


  bool isPasswordShow = true;
  IconData suffix = Icons.visibility_outlined;


  void ChangePasswordVisiability()
  {
    isPasswordShow = !isPasswordShow;

    suffix = isPasswordShow ? Icons.visibility_outlined:Icons.visibility_off_outlined ;

    emit(ChangePasswordVisibilityState());
  }


  void infoComplete(
      {required String name, required String password, required String email}) {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      isInfoComplete = true;
      emit((SignUpChangeBottomColorSuccessState()));
    } else {
      isInfoComplete = false;
      emit((SignUpChangeBottomColorErrorState()));
    }
  }

  Future<void> signUpWithGoogle() async {
    emit(SignUpWithGoogleLoadingState());

    var result = await authRepo.signUpWithGoogle();

    result.fold((failure) {
      emit(SignUpWithGoogleErrorState());
    }, (right) {
      emit(SignUpWithGoogleSuccessState());
    });
  }

  Future<void> signUpWithCompleteInformation(
      {required String name,
      required String emailAddress,
      required String password,
      required String countryName,
      }) async {
    emit(SignUpWithCompleteInformationLoadingState());

    var result =
        await authRepo.signUpWithCompleteInformation(emailAddress, password);

    result.fold((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(SignUpWithCompleteInformationErrorState(error.toString()));
    }, (credential) {
      storeTheUserInformation(
        name: name,
        countryName: countryName,
        emailAddress: emailAddress,
        userId: credential.user!.uid,
      );
      userId8 = credential.user!.uid;
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

    emit(SignUpDialogScreenState());
  }

  Future<void> storeTheUserInformation({
    required String name,
    required String emailAddress,
    required String countryName,
    required String userId,
  }) async {
    var result = await authRepo.storeTheUserInformation(
      name: name,
      emailAddress: emailAddress,
      userId: userId,
      countryName: countryName,
    );

    result.fold((error) {
      emit(SignUpStoreTheUserInformationErrorState(error.toString()));
    }, (r) {
      if (kDebugMode) {
        print(r);
      }
    });
    emit(SignUpStoreTheUserInformationSuccessState());
  }

  Future<void> pushAndEnd(context, String theNextScreen) async {
    await authRepo.pushAndEnd(context, theNextScreen).then((value) {
      emit(PushSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
      emit(PushErrorState());
    });
  }
}
