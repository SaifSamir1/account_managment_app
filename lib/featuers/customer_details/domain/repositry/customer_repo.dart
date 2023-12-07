


import 'package:dartz/dartz.dart';

abstract class CustomerRepo
{


  Future<Either<Exception, String>> createTheProductAndDeduction({
    required String productName,
    required String money,
    required DateTime dateTime,
    required String userId,
    required int customerId,
  });

  Future<Either<Exception, String>> upDateTheMainMoney({
    required int customerId,
    required int theNewMoney,
    required String userId,
  });


}
