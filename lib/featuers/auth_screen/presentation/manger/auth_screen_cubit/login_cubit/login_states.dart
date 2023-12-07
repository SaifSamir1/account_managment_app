import 'package:equatable/equatable.dart';

abstract class LoginStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class LoginInitialState extends LoginStates{}


class LoginAwesomeDialogState extends LoginStates{}


class ChangePasswordVisibilityState extends LoginStates{}



class LoginWithGoogleLoadingState extends LoginStates{}
class LoginWithGoogleSuccessState extends LoginStates{}
class LoginWithGoogleErrorState extends LoginStates{}




class LoginWithCompleteInformationLoadingState extends LoginStates{}
class LoginWithCompleteInformationSuccessState extends LoginStates{

  final String userId2;

  LoginWithCompleteInformationSuccessState(this.userId2);
}
class LoginWithCompleteInformationErrorState extends LoginStates
{
  final String errorMessage;

  LoginWithCompleteInformationErrorState(this.errorMessage);
}


class PushSuccessState extends LoginStates{}
class PushErrorState extends LoginStates{}



class LoginChangeBottomColorSuccessState extends LoginStates{}
class LoginChangeBottomColorErrorState extends LoginStates{}

