// ignore_for_file: deprecated_member_use

import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/enums/gender_enum.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_view_model.dart';
import 'package:flutter/material.dart';

class GenderRadioListTile extends StatefulWidget {
  final RegisterViewModel registerViewModel;
  const GenderRadioListTile({super.key, required this.registerViewModel});

  @override
  State<GenderRadioListTile> createState() => _GenderRadioListTileState();
}

class _GenderRadioListTileState extends State<GenderRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context).gender,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.gray,
            fontSize: 14,
          ),
        ),
        Flexible(
          child: RadioListTile(
            title: Text(
              AppLocalizations.of(context).female,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(overflow: TextOverflow.ellipsis),
            ),
            value: Gender.female,
            groupValue: widget.registerViewModel.selectedGender,
            onChanged: (value) {
              setState(() {
                widget.registerViewModel.selectedGender = value;
              });
            },
            activeColor: AppColors.mainColor,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.mainColor;
              }
              return AppColors.gray;
            }),
          ),
        ),
        Flexible(
          child: RadioListTile(
            title: Text(
              AppLocalizations.of(context).male,

              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(overflow: TextOverflow.ellipsis),
            ),
            value: Gender.male,
            groupValue: widget.registerViewModel.selectedGender,
            onChanged: (value) {
              setState(() {
                widget.registerViewModel.selectedGender = value;
              });
            },
            activeColor: AppColors.mainColor,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.mainColor;
              }
              return AppColors.gray;
            }),
          ),
        ),
      ],
    );
  }
}
