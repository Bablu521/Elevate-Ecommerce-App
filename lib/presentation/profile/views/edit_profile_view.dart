import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_event.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/edit_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<EditProfileCubit>()..doIntent(EditProfileGetInfoUser()),
      child: const Material(child: EditProfileBody()),
    );
  }
}
