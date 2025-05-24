import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';

class MFullScreenLoader {
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

  static stopLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
