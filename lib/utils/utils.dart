import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // change focus node
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // flutter toast
  static void flutterToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16,
    );
  }

  // another flush bar
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        // title: "Something went wrong",
        message: message,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        icon: const Icon(Icons.error, size: 30, color: Colors.white),
        backgroundColor: Colors.black,
        isDismissible: true,
        borderRadius: BorderRadius.circular(30),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        flushbarPosition: FlushbarPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        reverseAnimationCurve: Curves.easeInOut,
        forwardAnimationCurve: Curves.decelerate,
      )..show(context),
    );
  }
}
