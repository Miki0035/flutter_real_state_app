import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MScreenNotifier {
  static void openLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(
                color: MColor.blue,
              ),
            ),
          );
        });
  }

  static void showSnackBar(BuildContext context, String message,
      {required Color backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 14.0),
        content: Text(
          message,
          style:
          const TextStyle(color: Colors.white, fontSize: MSize.fontSizeMd),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static stopLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
