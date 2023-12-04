import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void toGetNavigate(Widget page) {
  Navigator.pushAndRemoveUntil(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ),
          (route) => false,
  );

}
