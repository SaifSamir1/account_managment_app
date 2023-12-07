import 'package:account_managment/featuers/customer_details/domain/repositry/customer_repo.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../home_screen/data/modle/customer_model.dart';
import '../../../../home_screen/data/modle/product_model.dart';
import 'customer_details_states.dart';

class CustomerDetailsCubit extends Cubit<CustomerDetailsStates> {
  CustomerDetailsCubit(this.customerRepo)
      : super(CustomerDetailsInitialState());


  CustomerRepo customerRepo;

  CustomerModel customerData = CustomerModel();

  void getCustomerData({required int customerId}) {
    emit(GetCustomerDataLoadingState());
    //كدا انا بجيب البانات المتخزنه ف ال firebaseFireStore اللي عملتها
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId8)
        .collection('customers')
        .doc('$customerId')
        .get()
        .then((value) {
      if (kDebugMode) {
        print(value.data());
      }
      customerData = CustomerModel.fromjson(value.data() ?? {});
      if (kDebugMode) {
        print(customerData.customerName);
      }
      emit(GetCustomerDataSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetCustomerDataErrorState(error.toString()));
    });
  }

  Future<void> createProductAndDeduction({
    required String productName,
    required String money,
    required int customerId,
    required DateTime dateTime,
  }) async {
    var result = await customerRepo.createTheProductAndDeduction(
        productName: productName,
        money: money,
        dateTime: dateTime,
        userId: userId8,
        customerId: customerId);
    result.fold((error) {
      emit(CreateProductErrorState(error.toString()));
    }, (r) {
      if (kDebugMode) {
        print(r);
      }
      emit(CreateProductSuccessState());
    });
  }

  // List<ProductModel> allProduct = [];
  //
  // void getAllProducts({required int customerId}){
  //   emit(GetALLProductLoadingState());
  //   allProduct = [];
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId8)
  //       .collection('customers')
  //       .doc('$customerId')
  //       .collection('productsAndDeduction')
  //       .orderBy('dateTime')
  //       .get()
  //       .then((value) {
  //     allProduct = [];
  //
  //     for (var element in value.docs) {
  //       allProduct.add(ProductModel.fromjson(element.data()));
  //     }
  //     emit(GetALLProductSuccessState());
  //   }).catchError((error) {
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //     emit(GetALLProductErrorState(error.toString()));
  //   });
  // }

  List<ProductModel> allProduct = [];

  void getAllProducts({required int customerId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId8)
        .collection('customers')
        .doc('$customerId')
        .collection('productsAndDeduction')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      allProduct = [];
      for (var element in event.docs) {
        allProduct.add(ProductModel.fromjson(element.data()));
      }
      emit(GetALLProductSuccessState());
    });
  }

  void upDateTheMainMoney({
    required int customerId,
    required int money,
  }) async
  {

    var result = await customerRepo.upDateTheMainMoney(
        customerId: customerId,
        theNewMoney: money,
        userId: userId8
    );
    result.fold((error) {
      emit(UpDateMoneyErrorState(error.toString()));
    }, (r) {
      if (kDebugMode) {
        print(r);
      }
      emit(UpDateMoneySuccessState());
    });
  }

  void awesomeDialog({
    required String desc,
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
