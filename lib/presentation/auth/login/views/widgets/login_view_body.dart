import 'dart:developer';

import 'package:elevate_ecommerce_app/core/common_widgets/custom_elevated_button.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/views/widgets/section_create_new_account.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/views/widgets/section_login_text_field.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/views/widgets/section_remember_me_and_forget_password.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(local.login, style: theme.textTheme.titleLarge),
            const SizedBox(height: 24),
            SectionLoginTextField(globalKey: globalKey),
            const SizedBox(height: 16),
            SectionRememberMeAndForgetPassword(),
            const SizedBox(height: 64),
            CustomElevatedButton(
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  log("success");
                }
              },
              buttonTitle: local.login,
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              onPressed: () {},
              buttonTitle: local.continueAsGuest,
              borderColor: theme.colorScheme.onSecondary,
              backgroundColor: theme.colorScheme.secondary,
              titleStyle: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
            const SizedBox(height: 16),
            SectionCreateNewAccount(),
          ],
        ),
      ),
    );
  }
}
