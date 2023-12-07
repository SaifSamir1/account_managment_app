import 'package:flutter/material.dart';

import 'hive_service.dart';

Color defaultColor = const Color(0xffE06738);

var isDataInDataBase = myBox!.get("isDataInDataBase");

var isDetailsInDataBase = myBox!.get("isDetailsInDataBase");

var notShowAuthScreenKey = myBox!.get("notShowAuthScreen");

final searchTextController = TextEditingController();

String userId8 = '';
