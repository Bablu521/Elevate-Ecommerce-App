import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/core/utils/loaders/loaders.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loading == true) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state.loginEntity != null) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          Loaders.showSuccessMessage(
            message: state.loginEntity?.message ?? "",
            context: context,
          );
          Navigator.pushReplacementNamed(context, RouteNames.home);
        } else if (state.errorMessage != null) {
          Navigator.pop(context);
          Loaders.showErrorMessage(
            message: state.errorMessage ?? "",
            context: context,
          );
        } else {}
      },
      child: widget,
    );
  }
}
