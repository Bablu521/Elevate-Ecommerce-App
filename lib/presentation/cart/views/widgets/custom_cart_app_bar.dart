import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomCartAppBar extends StatelessWidget {
  final int numOfCartItems;
  const CustomCartAppBar({super.key, required this.numOfCartItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${AppLocalizations.of(context).cart} ($numOfCartItems ${AppLocalizations.of(context).items})",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
