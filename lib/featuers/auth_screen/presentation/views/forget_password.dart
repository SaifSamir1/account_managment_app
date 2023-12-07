




import 'package:account_managment/featuers/auth_screen/presentation/views/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ForgetPasswordBody()),
    );
  }
}
