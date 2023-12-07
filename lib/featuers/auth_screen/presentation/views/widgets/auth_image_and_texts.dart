






import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';

class AuthImageAndTexts extends StatelessWidget {
  const AuthImageAndTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 10,
              top: 68),
          child: SizedBox(
              height: SizeConfig.defaultSize! * 25,
              child: Image.asset(AssetsData.auth1)),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 2.5,),
        const Text('مرحبا',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
        SizedBox(height: SizeConfig.defaultSize! * 3.8,),
        const Text('....يرجي انشاء حساب او تسجيل الدخول اولا ',style: TextStyle(color: Color(0xff4B5563)),),
        SizedBox(height: SizeConfig.defaultSize! * 3.8,),
      ],
    );
  }
}
