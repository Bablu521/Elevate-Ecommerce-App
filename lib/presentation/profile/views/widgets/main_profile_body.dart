import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/core/utils/loaders/loaders.dart';
import 'package:elevate_ecommerce_app/core/utils/widgets/user_guest_mode_page.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/main_profile_view_model/main_profile_states.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/main_profile_view_model/main_profile_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/main_profile_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainProfileBody extends StatelessWidget {
  const MainProfileBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainProfileViewModel, MainProfileStatus>(
      listener: (context, state) {
        if (state.profileLogoutState?.isLoading == true) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state.profileLogoutState?.errorMessage != null) {
          Navigator.pop(context);
          Loaders.showErrorMessage(
            message: state.profileLogoutState?.data?.message ?? "",
            context: context,
          );
        } else if (state.profileLogoutState?.data != null) {
          Navigator.pushReplacementNamed(context, RouteNames.login);
        }
      },
      builder: (context, state) {
        if (state.isLogged == false) {
          return const UserGuestModePage();
        } else if (state.profileInfoState?.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.profileInfoState?.errorMessage != null) {
          return Center(child: Text(state.profileInfoState!.errorMessage!));
        } else {
          return MainProfileBuilder(
            profileInfoEntity: state.profileInfoState!.data!,
          );
        }
      },
    );
  }
}
