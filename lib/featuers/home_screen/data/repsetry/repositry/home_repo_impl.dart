import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/repsetry/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Exception, String>> storeCustomerInformation({
    required String customerName,
    required String phone,
    required int customerId,
    required int money,
    required DateTime dateTime,
    required String userId,
  }) async {
    try {
      CustomerModel customerInfo = CustomerModel(
        id: customerId,
        phone: phone,
        customerName: customerName,
        money: money,
        dateTime: dateTime,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('customers')
          .doc('$customerId')
          .set(customerInfo.toMap());

      return const Right('create the customer successfully');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, String>> upDateCustomerInfo({
    required String customerName,
    required String phone,
    required int customerId,
    required int money,
    required DateTime dateTime,
    required String userId,
  }) async {
    try {
      CustomerModel customerInfo = CustomerModel(
        id: customerId,
        phone: phone,
        customerName: customerName,
        money: money,
        dateTime: dateTime,
      );
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection('customers')
          .doc('$customerId')
          .update(customerInfo.toMap());
      return const Right('create the customer successfully');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }


}
