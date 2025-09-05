import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomProfileRadio extends StatelessWidget {
  const CustomProfileRadio({super.key, required this.gender});
  final String gender;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Row(
      children: [
        Text(
          local.gender,
          style: theme.textTheme.headlineMedium!.copyWith(
            color: AppColors.gray,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Radio(value: "male", groupValue: gender, onChanged: (value) {}),
        Text(
          local.male,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(overflow: TextOverflow.ellipsis),
        ),
        Radio(value: "female", groupValue: gender, onChanged: (value) {}),
        Text(
          local.female,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
