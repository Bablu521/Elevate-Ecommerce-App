import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/utils/location_manager.dart';
import 'package:elevate_ecommerce_app/core/utils/validations.dart';
import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_events.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_states.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressViewBody extends StatefulWidget {
  final AddressViewModel addressViewModel;
  const AddAddressViewBody({super.key, required this.addressViewModel});

  @override
  State<AddAddressViewBody> createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  final Set<Marker> _markers = {};
  GoogleMapController? _mapController;
  BitmapDescriptor? customMarkerIcon;

  void validateForm() {
    setState(() {
      isFormValid =
          widget.addressViewModel.formKey.currentState?.validate() ?? false;
    });
  }

  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
    _getUserLocation();
    widget.addressViewModel.loadAllCities();
  }

  Future<void> _loadCustomMarker() async {
    final icon = await BitmapDescriptor.asset(
      ImageConfiguration.empty,
      AppImages.markerIconImage,
    );
    setState(() {
      customMarkerIcon = icon;
    });
  }

  Future<void> _getUserLocation() async {
    try {
      final position = await LocationManager.getCurrentLocation();

      setState(() {
        widget.addressViewModel.selectedLat = position.latitude;
        widget.addressViewModel.selectedLng = position.longitude;
        _markers.clear();
        _markers.add(
          Marker(
            markerId: MarkerId(AppLocalizations.of(context).selectedLocation),
            icon: customMarkerIcon ?? BitmapDescriptor.defaultMarker,
            position: LatLng(
              widget.addressViewModel.selectedLat!,
              widget.addressViewModel.selectedLng!,
            ),
            infoWindow: InfoWindow(
              title: AppLocalizations.of(context).selectedLocation,
            ),
          ),
        );
      });

      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              widget.addressViewModel.selectedLat!,
              widget.addressViewModel.selectedLng!,
            ),
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${AppLocalizations.of(context).failedToGetLocation} $e",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressViewModel, AddressStates>(
      bloc: widget.addressViewModel,
      listener: (context, state) {},
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              SizedBox(
                height: 200.h,
                child: GoogleMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                    if (widget.addressViewModel.selectedLat != null &&
                        widget.addressViewModel.selectedLng != null) {
                      _mapController!.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: LatLng(
                              widget.addressViewModel.selectedLat!,
                              widget.addressViewModel.selectedLng!,
                            ),
                            zoom: 15,
                          ),
                        ),
                      );
                    }
                  },
                  markers: _markers,
                  onTap: (LatLng tappedPoint) {
                    setState(() {
                      widget.addressViewModel.selectedLat =
                          tappedPoint.latitude;
                      widget.addressViewModel.selectedLng =
                          tappedPoint.longitude;
                      _markers.clear();
                      _markers.add(
                        Marker(
                          markerId: MarkerId(
                            AppLocalizations.of(context).selectedLocation,
                          ),
                          icon:
                              customMarkerIcon ??
                              BitmapDescriptor.defaultMarker,
                          position: tappedPoint,
                          infoWindow: InfoWindow(
                            title: AppLocalizations.of(
                              context,
                            ).selectedLocation,
                          ),
                        ),
                      );
                    });
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(31.036311802515517, 31.392967669886694),
                    zoom: 12,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Form(
                key: widget.addressViewModel.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: () => validateForm(),
                child: Column(
                  children: [
                    TextFormField(
                      controller: widget.addressViewModel.addressContoller,
                      validator: Validations.validateAddress,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).address,
                        hintText: AppLocalizations.of(context).enterTheAddress,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: widget.addressViewModel.phoneNumberContoller,
                      validator: Validations.validatePhoneNumber,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).phoneNumber,
                        hintText: AppLocalizations.of(context).enterPhoneNumber,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller:
                          widget.addressViewModel.recipientNameContoller,
                      validator: Validations.validateRecipientName,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).recipientName,
                        hintText: AppLocalizations.of(
                          context,
                        ).enterTheRecipientName,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder<List<CityEntity>>(
                            valueListenable: widget.addressViewModel.cities,
                            builder: (context, cities, child) {
                              return DropdownButtonFormField<String>(
                                key: ValueKey(
                                  AppLocalizations.of(context).cityDropdown,
                                ),
                                initialValue: widget.addressViewModel
                                    .getValidCityId(),
                                isExpanded: true,
                                style: Theme.of(context).textTheme.bodySmall,
                                validator: Validations.validateDropdown,
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context).city,
                                ),
                                onChanged: (cityId) async {
                                  if (cityId != null) {
                                    await widget.addressViewModel
                                        .onCitySelected(cityId);
                                    widget
                                        .addressViewModel
                                        .selectedCity = cities
                                        .firstWhere((city) => city.id == cityId)
                                        .nameEn;
                                  }
                                },
                                items: cities
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item.id,
                                        child: Text(
                                          item.nameEn ?? '',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 17.w),
                        Expanded(
                          child: ValueListenableBuilder<List<AreaEntity>>(
                            valueListenable: widget.addressViewModel.areas,
                            builder: (context, areas, child) {
                              return DropdownButtonFormField<String>(
                                key: ValueKey(
                                  '${AppLocalizations.of(context).areaDropdown}${areas.hashCode}',
                                ),
                                initialValue: widget.addressViewModel
                                    .getValidAreaId(),
                                isExpanded: true,
                                style: Theme.of(context).textTheme.bodySmall,
                                validator: Validations.validateDropdown,
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context).area,
                                ),
                                onChanged: areas.isEmpty
                                    ? null
                                    : (areaId) {
                                        if (areaId != null) {
                                          widget.addressViewModel
                                              .onAreaSelected(areaId);
                                        }
                                      },
                                items: areas
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item.id,
                                        child: Text(
                                          item.nameEn,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48.h),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFormValid
                        ? AppColors.mainColor
                        : AppColors.black[30],
                  ),
                  onPressed: () {
                    if (isFormValid) {
                      widget.addressViewModel.doIntent(OnAddAddressEvent());
                      widget.addressViewModel.addressContoller.clear();
                      widget.addressViewModel.phoneNumberContoller.clear();
                      widget.addressViewModel.recipientNameContoller.clear();
                      widget.addressViewModel.selectedCityId.value = null;
                      widget.addressViewModel.selectedAreaId.value = null;
                      widget.addressViewModel.selectedCity = null;
                      widget.addressViewModel.selectedLat = null;
                      widget.addressViewModel.selectedLng = null;
                      setState(() {
                        isFormValid = false;
                        _markers.clear();
                      });
                    }
                    // isFormValid
                    //     ? widget.addressViewModel.doIntent(OnAddAddressEvent())
                    //     : null;
                  },
                  child: Text(AppLocalizations.of(context).saveAddress),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
