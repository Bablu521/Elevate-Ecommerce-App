import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileItem extends StatelessWidget {
  final Widget firstWidget;
  final Widget? secondWidget;
  final String? text;
  final double? verticalPadding;
  final void Function()? onTap;
  const CustomProfileItem({
    super.key,
    required this.firstWidget,
    this.secondWidget,
    this.verticalPadding,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: verticalPadding ?? 16,
      ),
      child: Row(
        children: [
          firstWidget,
          SizedBox(width: 8.w),
          if (text != null) Text(text!, style: theme.textTheme.headlineMedium),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child:
                secondWidget ??
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.gray,
                ),
          ),
        ],
      ),
    );
  }
}
