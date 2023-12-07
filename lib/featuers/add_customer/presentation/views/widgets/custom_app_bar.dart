









import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/constant.dart';
import '../../../../../../../../core/utils/size_config.dart';

class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({
    required this.titleOfAppBar,
    required this.appBarIcon,
    required this.onPressed,
    super.key,
  });
  final String titleOfAppBar;
  final IconData appBarIcon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)
          )
      ),
      height: 92,
      width: SizeConfig.screenWidth,
      child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(onPressed:onPressed, icon: const Icon(Icons.arrow_back,color: Colors.white,),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(appBarIcon,color: Colors.white,),
                const SizedBox(width: 3,),
                Text(titleOfAppBar,style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
