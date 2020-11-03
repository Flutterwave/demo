import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'flutterwave_loader.dart';

class WidgetUtils {
  static void showSnackBar(final ScaffoldState state, final String message) {
    print("message in snackbar is $message");
    state.showSnackBar(
      SnackBar(
        content: (Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        )),
        duration: Duration(milliseconds: 1000),
        backgroundColor: HexColor("F5A623"),
      ),
    );
  }

  static showProgressDialog(final BuildContext context,
      final AnimationController animationController) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.infinity,
            height: 100,
            child: FutterwaveLoader(
              controller: animationController,
            ),
          ),
        );
      },
    );
  }
}
