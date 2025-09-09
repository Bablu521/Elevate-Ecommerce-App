import 'package:elevate_ecommerce_app/core/utils/validations.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SectionLoginTextField extends StatelessWidget {
  const SectionLoginTextField({
    super.key,
    required this.globalKey,
    required this.emailController,
    required this.passwordController,
  });
  final GlobalKey<FormState> globalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Form(
      key: globalKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            style: theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              label: Text(local.emailLabel),
              hintText: local.emailHintText,
            ),
            validator: (value) => Validations.validateEmail(value),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: passwordController,
            style: theme.textTheme.bodyMedium,
            obscureText: true,
            decoration: InputDecoration(
              label: Text(local.passwordLabel),
              hintText: local.passwordHintText,
            ),
            validator: (value) => Validations.validatePassword(value),
          ),
        ],
      ),
    );
  }
}
