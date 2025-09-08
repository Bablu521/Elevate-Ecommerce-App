import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionButtonLogin extends StatelessWidget {
  const SectionButtonLogin({
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
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    cubit.doIntent(
                      LoginEventRequest(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  }
                },
                child: Text(local.login),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.onSecondary,
                  shape: const StadiumBorder(
                    side: BorderSide(color: AppColors.gray),
                  ),
                ),
                onPressed: () {
                  cubit.doIntent(LoginEventContinueAsGuest());
                  Navigator.pushReplacementNamed(context, RouteNames.home);
                  // Navigate to home
                },
                child: Text(
                  local.continueAsGuest,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.gray,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
