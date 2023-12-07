
















import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Center(
        child: Text('No Result Found . . . . .',style: TextStyle(
          fontSize: 20,
          color: defaultColor,
          fontWeight: FontWeight.w500,
        ),),
      ),
    );
  }
}
