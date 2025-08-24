import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SectionCreateNewAccount extends StatelessWidget {
  const SectionCreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          local.dontHaveAccount,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to SignUp screen
            Navigator.pushNamed(context, RouteNames.register);
          },
          child: Text(
            local.signUp,
            style: theme.textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
              color: theme.colorScheme.primary,
              decorationColor: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
