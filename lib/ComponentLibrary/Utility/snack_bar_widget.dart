import 'package:flutter/material.dart';

class SnackbarPopUp {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String? text, Color? color) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color,
    );

    final messengerState = messengerKey.currentState;
    if (messengerState != null) {
      messengerState
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
