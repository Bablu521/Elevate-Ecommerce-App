import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';
import 'loading_circle.dart';
class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
  });
  final double? width, height;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: height,
      width: width,
      onPressed: () {},
      buttonTitle: "",
      isText: false,
      backgroundColor: backgroundColor,
      child: const LoadingCircle(),
    );
  }
}
