import 'package:elevate_ecommerce_app/core/common_widgets/custom_text_form_field.dart';
import 'package:elevate_ecommerce_app/core/utils/validations.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SectionLoginTextField extends StatelessWidget {
  const SectionLoginTextField({super.key, required this.globalKey});
  final GlobalKey<FormState> globalKey;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Form(
      key: globalKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        children: [
          CustomTextFormField(
            label: local.emailLabel,
            hintText: local.emailHintText,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.shadow,
            ),
            validator: (value) => Validations.emailValidation(email: value),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            label: local.passwordLabel,
            hintText: local.passwordHintText,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.shadow,
            ),
            validator:
                (value) => Validations.passwordValidation(password: value),
          ),
        ],
      ),
    );
  }
}
