import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class WidgetUtils {
  static void showSnackBar(final ScaffoldState state, final String message) {
    state.showSnackBar(
      SnackBar(
        content: (Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18),
        )),
        duration: Duration(milliseconds: 1000),
        backgroundColor: HexColor("F5A623"),
      ),
    );
  }
}