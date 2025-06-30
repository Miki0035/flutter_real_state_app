
import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomScrollBehaviour extends MaterialScrollBehavior {

  @override
  // TODO: implement dragDevices
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
    PointerDeviceKind.trackpad
  };
}