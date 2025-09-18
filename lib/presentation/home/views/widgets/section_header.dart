import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionHeader({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            AppLocalizations.of(context).viewAll,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.mainColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
