import 'package:account_managment/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../manger/auth_screen_cubit/signup_cubit/signup_cubit.dart';
import '../../manger/auth_screen_cubit/signup_cubit/signup_states.dart';

class CustomCreateAccountTextField extends StatelessWidget {
  const CustomCreateAccountTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpStates>(
        builder: (BuildContext context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 28.0),
              child: Text(
                'الاسم بالكامل ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            DefultTextForm(
                controller: signUpCubit.nameControllerReg,
                hintText: ' ....ادخل اسمك ',
                keyBoardType: TextInputType.name,
                valedate: (value) {
                  if (value!.isEmpty) {
                    return 'الاسم لا يجب ان يكون فارغ';
                  }
                  return null;
                },
            ),
            const SizedBox(
              height: 15,
            ),
             Padding(
              padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 27.0),
              child: Text(
                'البريد الالكتروني',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            DefultTextForm(
                controller: signUpCubit.emailControllerReg,
                keyBoardType: TextInputType.name,
                hintText: 'Eg namaemail@emailkamu.com',
                valedate: (value) {
                  if (value!.isEmpty) {
                    return 'البريد الالكتروني لا يجب ان يكون فارغ';
                  }
                  return null;
                },
            ),
            const SizedBox(
              height: 15,
            ),
             Padding(
              padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 28.0),
              child: Text(
                'ادخل اسم البلد',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            DefultTextForm(
              controller: signUpCubit.countryNameControllerReg,
              keyBoardType: TextInputType.name,
              hintText: '.... اسم البلد',
              valedate: (value) {
                if (value!.isEmpty) {
                  return 'اسم البلد لا يجب ان يكون فارغ';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 29.5),
              child: Text(
                'الرقم السري',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            DefultTextForm(
                controller: signUpCubit.passwordControllerReg,
                hintText: '**** **** ****',
                keyBoardType: TextInputType.name,
                suffixIcon: Icon(signUpCubit.suffix),
                valedate: (value) {
                  if (value!.isEmpty) {
                    return 'الرقم السري لا يجب ان يكون فارغ';
                  }
                  return null;
                },
              suffixPressed: ()
              {
                signUpCubit.ChangePasswordVisiability();
                return null;
              },
                obscuringCharacter: '*',
                obscuretext: signUpCubit.isPasswordShow,
            ),
          ],
        ),
      );
    });
  }
}
