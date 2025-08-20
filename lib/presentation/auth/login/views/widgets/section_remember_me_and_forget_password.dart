import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SectionRememberMeAndForgetPassword extends StatelessWidget {
  const SectionRememberMeAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: true, onChanged: (value) {}),
            Text(
              local.rememberMe,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            local.forgetPassword,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSecondary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
