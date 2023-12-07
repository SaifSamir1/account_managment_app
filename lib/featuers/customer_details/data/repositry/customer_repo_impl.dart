







import 'package:account_managment/featuers/customer_details/domain/repositry/customer_repo.dart';
import 'package:account_managment/featuers/home_screen/data/modle/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';


class CustomerRepoImpl extends CustomerRepo {

  @override
  Future<Either<Exception, String>> createTheProductAndDeduction(
      {required String productName,
        required String money,
        required DateTime dateTime,
        required String userId,
        required int customerId,
      }) async
  {
    try {
      ProductModel productModel = ProductModel(
        productName: productName,
        money: money,
        dateTime: dateTime,
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('customers')
          .doc('$customerId')
          .collection('productsAndDeduction')
          .doc()
          .set(productModel.toMap());
      return const Right('create the customer successfully');
    }catch(e){
      return Left(Exception(e.toString()));
    }
  }


  @override
  Future<Either<Exception, String>> upDateTheMainMoney({
    required int customerId,
    required int theNewMoney,
    required String userId,
  }) async
  {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection('customers')
          .doc('$customerId')
          .update({
        'money': theNewMoney,
      });
      return const Right('UpDate Money  successfully');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
