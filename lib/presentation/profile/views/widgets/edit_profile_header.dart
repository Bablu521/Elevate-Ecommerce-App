import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context , true);
          },
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        Text(
          local.editProfile,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        GestureDetector(onTap: () {
          // Navigator.pushNamed(context, RouteNames.notifications);
        }, child: const Icon(Icons.notifications_outlined)),
      ],
    );
  }
}
