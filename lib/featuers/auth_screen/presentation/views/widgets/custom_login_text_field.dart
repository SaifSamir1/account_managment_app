import 'package:account_managment/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../manger/auth_screen_cubit/login_cubit/login_cubit.dart';
import '../../manger/auth_screen_cubit/login_cubit/login_states.dart';

class CustomLoginTextField extends StatelessWidget {
  const CustomLoginTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
        builder: (BuildContext context, state) {
      var loginCubit = BlocProvider.of<LoginCubit>(context);
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              controller: loginCubit.emailControllerLogin,
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
              controller: loginCubit.passwordControllerLogin,
              hintText: '**** **** ****',
              keyBoardType: TextInputType.name,
              suffixIcon: Icon(loginCubit.suffix),
              suffixPressed: ()
              {
                loginCubit.ChangePasswordVisiability();
                return null;
              },
              valedate: (value) {
                if (value!.isEmpty) {
                  return 'الرقم السري لا يجب ان يكون فارغ';
                }
                return null;
              },
              obscuringCharacter: '*',
              obscuretext: loginCubit.isPasswordShow,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.defaultSize! * 22.9,
                bottom: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kForgetPassword);
                },
                child: Text(
                  "هل نسيت كلمة السر ؟",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: defaultColor
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
