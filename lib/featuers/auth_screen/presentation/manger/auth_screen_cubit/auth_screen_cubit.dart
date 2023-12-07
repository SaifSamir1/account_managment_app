import 'package:account_managment/core/utils/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../views/create_account.dart';
import '../../views/login_screen.dart';
import 'auth_screen_states.dart';

class AuthScreenCubit extends Cubit<AuthScreenStates> {
   AuthScreenCubit() : super(AuthScreenInitialState());

  List<String> itemsOfAuth = ['CreateAccount', 'Login'];

  List listScreen = [
    const CreateAccountScreen(),
    const LoginScreen(),
  ];

  int currentIndex = 0;



  void changeIndexListView(int index) {
    currentIndex = index;
    emit(AuthScreenChangeIndexState());
  }

  Color changeListColor(int index) {
    if (currentIndex == index) {
      emit(AuthScreenChangeListColorState());
      return defaultColor;
    } else {
      emit(AuthScreenChangeListColorState());
      return const Color(0xff89909E);
    }
  }



}
