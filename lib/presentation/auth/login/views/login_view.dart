import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<LoginCubit>(),
        child: const LoginViewBody(),
      ),
    );
  }
}
