import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/widgets.dart';

class PasswordRecoverySucceededScreen extends StatelessWidget {
  const PasswordRecoverySucceededScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            const SizedBox(
                height:150,
                width: 150,
                child: Image(
                  image: AssetImage(AssetsData.checkmark),
                )),
            const Text(
              'Success',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:  60.0),
              child: Text(
                'رجاءا تفقد الايميل الخاص بك لاتمام عملية تغير كلمة السر',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff6B7280)
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: ()
                    {
                      GoRouter.of(context).pushReplacement(AppRouter.kForgetPassword);
                    },
                    child: Text(
                      'اعادة الارسال',
                      style: TextStyle(
                        fontSize: 14,
                        color: defaultColor,
                      ),
                    ))
              ],
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            customForgetPasswordBottom(
                onPressed: ()
                {
                  GoRouter.of(context).pushReplacement(AppRouter.kAuthScreen);
                },
                text: 'تسجيل الدخول',
                colorBottom: defaultColor,
                textColor: Colors.white),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
