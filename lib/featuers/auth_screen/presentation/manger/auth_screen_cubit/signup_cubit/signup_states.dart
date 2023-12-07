

import 'package:equatable/equatable.dart';

abstract class SignUpStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class SignUpInitialState extends SignUpStates{}


class ChangePasswordVisibilityState extends SignUpStates{}




class SignUpChangeBottomColorSuccessState extends SignUpStates{}
class SignUpChangeBottomColorErrorState extends SignUpStates{}


class SignUpStoreTheUserInformationSuccessState extends SignUpStates{}
class SignUpStoreTheUserInformationErrorState extends SignUpStates
{
  final String errMessage;

   SignUpStoreTheUserInformationErrorState(this.errMessage);
}


class SignUpWithCompleteInformationLoadingState extends SignUpStates{}
class SignUpWithCompleteInformationSuccessState extends SignUpStates{}
class SignUpWithCompleteInformationErrorState extends SignUpStates
{
  final String errMessage;

  SignUpWithCompleteInformationErrorState(this.errMessage);
}



class SignUpWithGoogleLoadingState extends SignUpStates{}
class SignUpWithGoogleSuccessState extends SignUpStates{}
class SignUpWithGoogleErrorState extends SignUpStates{}



class SignUpDialogScreenState extends SignUpStates{}


class PushSuccessState extends SignUpStates{}
class PushErrorState extends SignUpStates{}
