import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/views/widgets/login_listener.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/views/widgets/section_button_login.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: LoginListener(
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(local.login, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 24),
              SectionLoginTextField(
                globalKey: globalKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 16),
              const SectionRememberMeAndForgetPassword(),
              const SizedBox(height: 64),
              SectionButtonLogin(
                globalKey: globalKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 16),
              const SectionCreateNewAccount(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
