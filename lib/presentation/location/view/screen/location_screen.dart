import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/custom_widget/custom_dialog.dart';
import '../../../../core/di/di.dart';
import '../../../../generated/l10n.dart';
import '../../view_model/location_events.dart';
import '../../view_model/location_view_model.dart';
import '../widget/location_view_body.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late final LocationViewModel locationViewModel;

  @override
  void initState() {
    super.initState();
    locationViewModel = getIt<LocationViewModel>();
    locationViewModel.doIntent(
      GetOrderLocationEvent("68efde9d7fee68a4c2ec2e18"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationViewModel, LocationState>(
        bloc: locationViewModel,
        listener: (context, state) {
          if (state.errorMessage != null) {
            CustomDialog.positiveButton(
              context: context,
              cancelable: false,
              title: AppLocalizations.of(context).error,
              message: state.errorMessage!,
              positiveOnClick: () {
                Navigator.pop(context);
              },
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }
          return LocationViewBody(locationViewModel: locationViewModel);
        },
      ),
    );
  }
}
