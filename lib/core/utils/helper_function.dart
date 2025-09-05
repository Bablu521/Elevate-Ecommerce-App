import 'package:flutter/material.dart';

abstract class HelperFunction {
  static void dismissDialog(BuildContext context) {
    if (ModalRoute.of(context)?.isCurrent != true &&
        Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

}
