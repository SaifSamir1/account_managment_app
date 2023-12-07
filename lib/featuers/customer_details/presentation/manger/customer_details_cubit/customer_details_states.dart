









import 'package:equatable/equatable.dart';

abstract class CustomerDetailsStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class CustomerDetailsInitialState extends CustomerDetailsStates{}




//
// class InsertDataSuccessState extends CustomerDetailsStates{}
// class InsertDataErrorState extends CustomerDetailsStates{}
//
//
class UpDateMoneySuccessState extends CustomerDetailsStates{}
class UpDateMoneyErrorState extends CustomerDetailsStates{
  final String error ;

  UpDateMoneyErrorState(this.error);
}

//
// class ReadDataSuccessState extends CustomerDetailsStates{}
//
//
// class DeleteDataSuccessState extends CustomerDetailsStates{}
// class DeleteDataErrorState extends CustomerDetailsStates{}
//
//

class DialogScreenState extends CustomerDetailsStates{}

class GetCustomerDataLoadingState extends CustomerDetailsStates{}
class GetCustomerDataSuccessState extends CustomerDetailsStates{}
class GetCustomerDataErrorState extends CustomerDetailsStates
{
  final String error ;

  GetCustomerDataErrorState(this.error);
}


class CreateProductSuccessState extends CustomerDetailsStates{}
class CreateProductErrorState extends CustomerDetailsStates
{
  final String error ;

  CreateProductErrorState(this.error);
}



class GetALLProductLoadingState extends CustomerDetailsStates{}
class GetALLProductSuccessState extends CustomerDetailsStates{}
class GetALLProductErrorState extends CustomerDetailsStates
{
  final String error ;

  GetALLProductErrorState(this.error);
}

