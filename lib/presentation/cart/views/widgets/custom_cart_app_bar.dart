import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartAppBar extends StatelessWidget {
  const CustomCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        SizedBox(width: 8.w),
        Text(
          "${AppLocalizations.of(context).cart} (3 ${AppLocalizations.of(context).items}) ",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
