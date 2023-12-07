

import 'package:account_managment/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontSize: 14,
      ),
      cursorColor: defaultColor,
      textInputAction: TextInputAction.search,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'ابحث عن اسم الزبون',
          suffixIcon:
          IconButton(
            padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.black26,
              icon:const Icon(Icons.search_sharp)),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: const BorderSide(
            color: Colors.black26
        )
    );
  }
}
