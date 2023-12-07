




import 'package:account_managment/featuers/auth_screen/presentation/views/widgets/auth_screen_body.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Color(0xffFFFFFF),
        body: SafeArea(child: AuthScreenBody()),
    );
  }
}

