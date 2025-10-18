import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../view_model/location_view_model.dart';
import 'location_info_widget.dart';

class LocationViewBody extends StatelessWidget {
  final LocationViewModel locationViewModel;

  const LocationViewBody({super.key, required this.locationViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GoogleMap(
            onMapCreated: (controller) {
              locationViewModel.mapController = controller;
            },
            markers: locationViewModel.markers,
            polylines: locationViewModel.polylines,
            initialCameraPosition: CameraPosition(
              target: locationViewModel.liveLocation!,
              zoom: 12,
            ),
          ),
        ),
        LocationInfoWidget(locationViewModel: locationViewModel),
      ],
    );
  }
}
