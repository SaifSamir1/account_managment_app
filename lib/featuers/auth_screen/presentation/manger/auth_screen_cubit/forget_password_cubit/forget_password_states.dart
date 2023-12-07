



import 'package:equatable/equatable.dart';

abstract class ForgetPasswordStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ForgetPasswordInitialState extends ForgetPasswordStates{}



class ForgetPasswordChangeBottomColorSuccessState extends ForgetPasswordStates{}
class ForgetPasswordChangeBottomColorErrorState extends ForgetPasswordStates{}



class ResetPasswordAndSendItToMyEmailErrorState extends ForgetPasswordStates{
  final String errorMessage;

  ResetPasswordAndSendItToMyEmailErrorState(this.errorMessage);
}
class ResetPasswordAndSendItToMyEmailSuccessState extends ForgetPasswordStates{}


class DialogScreenState extends ForgetPasswordStates{}
