





import 'package:dartz/dartz.dart';

abstract class HomeRepo
{

  Future<Either<Exception,String>> storeCustomerInformation({
    required String customerName,
    required String phone,
    required int customerId,
    required int money,
    required DateTime dateTime,
    required String userId,

  });

  Future<Either<Exception,String>> upDateCustomerInfo({
    required String customerName,
    required String phone,
    required int customerId,
    required int money,
    required DateTime dateTime,
    required String userId,
  });





}
