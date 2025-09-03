import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_event.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionRememberMeAndForgetPassword extends StatefulWidget {
  const SectionRememberMeAndForgetPassword({super.key});

  @override
  State<SectionRememberMeAndForgetPassword> createState() =>
      _SectionRememberMeAndForgetPasswordState();
}

class _SectionRememberMeAndForgetPasswordState
    extends State<SectionRememberMeAndForgetPassword> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Checkbox(
                  value: state.rememberMe,
                  onChanged: (value) {
                    cubit.doIntent(
                      LoginEventRememberMe(rememberMe: value ?? false),
                    );
                  },
                );
              },
            ),
            Text(
              local.rememberMe,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.forgetPassword);
          },
          child: Text(
            local.forgetPassword,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.secondary,
              decoration: TextDecoration.underline,
              decorationColor: theme.colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
