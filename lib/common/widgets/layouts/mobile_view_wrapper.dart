import 'package:flutter/material.dart';

class MobileViewWrapper extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const MobileViewWrapper({
    super.key,
    required this.child,
    this.maxWidth = 414, // typical mobile width
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWeb = constraints.maxWidth > maxWidth;

        return Container(
          color: Colors.grey[300], // background for outside the "device"
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: isWeb ? maxWidth : constraints.maxWidth,
            height: constraints.maxHeight * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30), // rounded corners
              border: Border.all(
                color: Colors.black.withValues(alpha: 0.2),
                width: 2,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: child,
          ),
        );
      },
    );
  }
}
