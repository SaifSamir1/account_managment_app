









import 'package:equatable/equatable.dart';

import '../../../data/modle/customer_model.dart';

abstract class HomeStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class HomeScreenInitialState extends HomeStates{}


class InsertDataSuccessState extends HomeStates{}
class InsertDataErrorState extends HomeStates{}


class CreateCustomerSuccessState extends HomeStates{}
class CreateCustomerErrorState extends HomeStates{
  final String errorMessage;

  CreateCustomerErrorState(this.errorMessage);
}


class UpDateDataSuccessState extends HomeStates{}
class UpDateDataErrorState extends HomeStates{
  final String error ;

  UpDateDataErrorState(this.error);
}


class DeleteDataSuccessState extends HomeStates{}
class DeleteDataErrorState extends HomeStates{}


class DialogScreenState extends HomeStates{}


class GetUserLoadingState extends HomeStates{}
class GetUserSuccessState extends HomeStates{}
class GetUserErrorState extends HomeStates
{
  final String error ;

  GetUserErrorState(this.error);
}



class GetCustomerDataLoadingState extends HomeStates{}
class GetCustomerDataSuccessState extends HomeStates{}
class GetCustomerDataErrorState extends HomeStates
{
  final String error ;

  GetCustomerDataErrorState(this.error);
}



class GetALLCustomersLoadingState extends HomeStates{}
class GetALLCustomerSuccessState extends HomeStates{

  final List<CustomerModel> customers ;

  GetALLCustomerSuccessState(this.customers);
}
class GetALLCustomerErrorState extends HomeStates
{
  final String error ;

  GetALLCustomerErrorState(this.error);
}

class SignOutSuccessState extends HomeStates{}
