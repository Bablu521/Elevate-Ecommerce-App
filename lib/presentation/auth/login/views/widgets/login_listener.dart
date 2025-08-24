import 'package:elevate_ecommerce_app/core/custom_widget/custom_dialog.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loading == true) {
          CustomDialog.loading(context: context, message: local.loading);
        } else if (state.loginEntity != null) {
          Navigator.pop(context);
          CustomDialog.positiveButton(context: context, title: local.success);
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacementNamed(context, RouteNames.home);
          });
        } else if (state.errorMessage != null) {
          Navigator.pop(context);
          CustomDialog.positiveButton(
            context: context,
            title: local.error,
            message: state.errorMessage,
          );
        } else {}
      },
      child: widget,
    );
  }
}
