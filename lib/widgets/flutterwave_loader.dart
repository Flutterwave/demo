import 'dart:math' as math;

import 'package:flutter/material.dart';

class FutterwaveLoader extends AnimatedWidget {
  FutterwaveLoader({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.fromLTRB(40, 40, 40, 20),
        child: Image.asset("images/flutterwave.png"),
      ),
    );
  }
}