




import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';

import '../../../../domain/repositrise/auth_repo.dart';
import 'forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates>
{
  ForgetPasswordCubit(this.authRepo):super(ForgetPasswordInitialState());


  final AuthRepo authRepo;
  bool changeColorOfBottom = false;

  void changeColorOfBottomF(String email)
  {
    if(email.isNotEmpty){
      changeColorOfBottom =true;
      emit(ForgetPasswordChangeBottomColorSuccessState());
    }
    else{
      changeColorOfBottom=false;
      emit(ForgetPasswordChangeBottomColorErrorState());
    }
  }


  bool changeColorOfBottomNewPasswordV=false;

  void changeColorOfBottomNewPassword(String password,String confarmPassword)
  {
    if(password.isNotEmpty && confarmPassword.isNotEmpty){
      changeColorOfBottomNewPasswordV =true;
      emit(ForgetPasswordChangeBottomColorSuccessState());
    }
    else{
      changeColorOfBottomNewPasswordV=false;
      emit(ForgetPasswordChangeBottomColorErrorState());
    }
  }


  Future<void> resetPasswordAndSendItToMyEmail({required String email}) async
  {
    var result = await authRepo.resetPasswordAndSendItToMyEmail(email);
    result.fold((error) {
      emit(ResetPasswordAndSendItToMyEmailErrorState(error.toString()));
    }, (credential) {
      emit(ResetPasswordAndSendItToMyEmailSuccessState());
    });
  }


  void awesomeDialog(
      {required String desc,
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

    emit(DialogScreenState());
  }
}