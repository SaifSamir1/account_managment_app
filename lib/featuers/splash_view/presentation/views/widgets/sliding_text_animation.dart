import 'package:account_managment/core/utils/constant.dart';
import 'package:flutter/material.dart';

class SlidingTextAnimated extends StatelessWidget {
  const SlidingTextAnimated({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: slidingAnimation,
        child: Text('Welcome ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: defaultColor,
            inherit: false,
          ),
        ));
  }
}
