// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SnackBarMsg {
  static void snackBarSuccess({
    BuildContext? context,
    Duration? duration,
    String? message,
  }) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: duration!,
        content: Text('$message'),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void snackBarFailed({
    BuildContext? context,
    Duration? duration,
    String? message,
  }) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: duration!,
        content: Text('$message'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
