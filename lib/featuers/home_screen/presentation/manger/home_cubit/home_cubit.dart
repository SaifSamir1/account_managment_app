import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../auth_screen/data/models/store_the_user_info_model.dart';
import '../../../domain/repsetry/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit(this.homeRepo) : super(HomeScreenInitialState());

  UserInfoModel userModel = UserInfoModel();


  List<CustomerModel> allCustomer = [];
  CustomerModel customerData = CustomerModel();

  HomeRepo homeRepo;

  List allMoney = [];

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

  Future<void> createCustomer({
    required String customerName,
    required String phone,
    required int customerId,
    required int money,
    required DateTime dateTime,
  }) async {
    var result = await homeRepo.storeCustomerInformation(
        customerName: customerName,
        phone: phone,
        customerId: customerId,
        money: money,
        dateTime: dateTime,
        userId: userId8
    );
    result.fold((error) {
      emit(CreateCustomerErrorState(error.toString()));
    }, (r) {
      if (kDebugMode) {
        print(r);
      }
      emit(CreateCustomerSuccessState());
    });
  }

  void getUserData() {
    emit(GetUserLoadingState());
    //كدا انا بجيب البانات المتخزنه ف ال firebaseFireStore اللي عملتها
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId8)
        .get()
        .then((value) {
      if (kDebugMode) {
        print(value.data());
      }
      userModel = UserInfoModel.fromjson(value.data() ?? {});
      if (kDebugMode) {
        print(userModel.email);
      }
      emit(GetUserSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }

      emit(GetUserErrorState(error.toString()));
    });
  }


  Future<void> reFresh() async{
    emit(GetALLCustomersLoadingState());
    allCustomer = [];
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId8)
        .collection('customers')
        .orderBy('dateTime')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allCustomer.add(CustomerModel.fromjson(element.data())) ;
      }
      emit(GetALLCustomerSuccessState(allCustomer));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetALLCustomerErrorState(error.toString()));
    });
  }

  void getAllCustomer() {
    emit(GetALLCustomersLoadingState());
    allCustomer = [];
     FirebaseFirestore.instance
        .collection('users')
        .doc(userId8)
        .collection('customers')
        .orderBy('dateTime')
        .get()
        .then((value) {
          for (var element in value.docs) {
            allCustomer.add(CustomerModel.fromjson(element.data())) ;
          }
          emit(GetALLCustomerSuccessState(allCustomer));
    }).catchError((error) {
      emit(GetALLCustomerErrorState(error.toString()));
    });
  }

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


  void upDateCustomerDetails({
    required String customerName,
    required String phone,
    required int customerId,
    required int money,
    required DateTime dateTime,}) async
  {

    var result = await homeRepo.upDateCustomerInfo(
        customerName: customerName,
        phone: phone,
        customerId: customerId,
        money: money,
        dateTime: dateTime,
        userId: userId8
    );
    result.fold((error) {
      emit(UpDateDataErrorState(error.toString()));
    }, (r) {
      if (kDebugMode) {
        print(r);
      }
      emit(UpDateDataSuccessState());
    });
  }


  void logOut() async
  {
    await FirebaseAuth.instance.signOut().then((value){
      emit(SignOutSuccessState());
    });
  }
}
