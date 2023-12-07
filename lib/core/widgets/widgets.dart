import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/assets.dart';
import '../utils/constant.dart';
import '../utils/size_config.dart';

Container defaultText({required String text}) {
  return Container(
    alignment: Alignment.bottomRight,
    width: SizeConfig.screenWidth,
    child: Text(
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}

TextFormField defaultTextFormField({
  required TextInputType keyboardType,
  required TextEditingController controller,
}) {
  return TextFormField(
    style: const TextStyle(
      fontSize: 15,
    ),
    controller: controller,
    keyboardType: keyboardType,
    cursorColor: defaultColor,
    textInputAction: TextInputAction.search,
    textDirection: TextDirection.rtl,
    decoration: InputDecoration(
      enabledBorder: buildOutlineInputBorder(),
      focusedBorder: buildOutlineInputBorder(),
    ),
  );
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: const BorderSide(color: Colors.black26));
}

Widget defaultButton({
  required onPressedFunction,
  double width = double.infinity,
  required Color backGroundColor,
  Color? textColor,
  required double height,
  bool isUpperCase = true,
  required String text,
  required bool? googleImage,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: TextButton(
        onPressed: onPressedFunction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (googleImage == true)
              const SizedBox(
                  width: 20,
                  height: 20,
                  child: Image(image: AssetImage(AssetsData.googlePhoto))),
            SizedBox(
              width: 8,
            ),
            Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

Widget DefultTextForm({
  required TextEditingController controller,
  String? hintText,
  String? obscuringCharacter,
  required TextInputType keyBoardType,
  Function(String)? onChange,
  Widget? suffixIcon,
  Function? suffixPressed()?,
  ValueChanged<String>? onFieldSubmitted,
  required FormFieldValidator<String> valedate,
  bool obscuretext = false,
  Function? ontap()?,
}) =>
    TextFormField(
        onChanged: onChange,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xffBEC5D1))),
            hintText: hintText,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: suffixIcon,
                  )
                : null),
        keyboardType: keyBoardType,
        onFieldSubmitted: onFieldSubmitted,
        validator: valedate,
        obscureText: obscuretext,
        onTap: ontap,
        obscuringCharacter: obscuringCharacter ?? '.');

MaterialButton customForgetPasswordBottom(
    {required VoidCallback onPressed,
    required Color colorBottom,
    required Color textColor,
    required String text}) {
  return MaterialButton(
    onPressed: onPressed,
    color: colorBottom,
    elevation: 0.0,
    height: 49,
    minWidth: 256,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.transparent)),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
      ),
    ),
  );
}

void showFlutterToastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: defaultColor,
    textColor: Colors.white,
  );
}

void showFlutterToastError(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
  );
}

Widget buildNoInternetWidget() {
  return Container(
    width: double.infinity,
    color: Colors.white,
    child:Center(
      child: Text(
        'لا يوجد اتصال .. برجاء تفقد الانترنت',
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
      ),
    ),
  );
}
