import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/utils/location_manager.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_events.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/address/views/widgets/add_address_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressViewBody extends StatefulWidget {
  final AddressViewModel addressViewModel;
  final AddressEntity? addressEntity;
  const AddAddressViewBody({
    super.key,
    required this.addressViewModel,
    this.addressEntity,
  });

  @override
  State<AddAddressViewBody> createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  final Set<Marker> _markers = {};
  GoogleMapController? _mapController;
  BitmapDescriptor? customMarkerIcon;
  bool isFormValid = false;
  bool isUpdateMode = false;

  void validateForm() {
    setState(() {
      isFormValid =
          widget.addressViewModel.formKey.currentState?.validate() ?? false;
    });
  }

  void resetControllers() {
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
      isUpdateMode = false;
      _markers.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
    _getUserLocation();

    if (widget.addressEntity != null) {
      isUpdateMode = true;
      widget.addressViewModel.addressContoller.text =
          widget.addressEntity!.street ?? "";
      widget.addressViewModel.phoneNumberContoller.text =
          widget.addressEntity!.phone ?? "";
      widget.addressViewModel.recipientNameContoller.text =
          widget.addressEntity!.username ?? "";
      widget.addressViewModel.selectedCity = widget.addressEntity!.city ?? "";
      widget.addressViewModel.selectedLat =
          double.tryParse(widget.addressEntity!.lat ?? "") ?? 0.0;
      widget.addressViewModel.selectedLng =
          double.tryParse(widget.addressEntity!.long ?? "") ?? 0.0;

      widget.addressViewModel.loadAllCities().then((_) {
        if (mounted && widget.addressEntity!.city != null) {
          final city = widget.addressViewModel.cities.value.firstWhere(
            (c) => c.nameEn == widget.addressEntity!.city,
            orElse: () => const CityEntity(id: '', nameEn: '', nameAr: ''),
          );
          if (city.id!.isNotEmpty) {
            widget.addressViewModel.selectedCityId.value = city.id;
            widget.addressViewModel.loadAreasRelatedToCity(city.id!);
          }
        }
      });
    } else {
      resetControllers();
      widget.addressViewModel.loadAllCities();
    }
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
    return SingleChildScrollView(
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
                    widget.addressViewModel.selectedLat = tappedPoint.latitude;
                    widget.addressViewModel.selectedLng = tappedPoint.longitude;
                    _markers.clear();
                    _markers.add(
                      Marker(
                        markerId: MarkerId(
                          AppLocalizations.of(context).selectedLocation,
                        ),
                        icon:
                            customMarkerIcon ?? BitmapDescriptor.defaultMarker,
                        position: tappedPoint,
                        infoWindow: InfoWindow(
                          title: AppLocalizations.of(context).selectedLocation,
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
            AddAddressForm(addressViewModel: widget.addressViewModel,validateForm: validateForm,),
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
                    if (isUpdateMode && widget.addressEntity!.id != null) {
                      widget.addressViewModel.doIntent(
                        OnUpdateAddressEvent(
                          addressId: widget.addressEntity!.id!,
                        ),
                      );
                      resetControllers();
                    } else {
                      widget.addressViewModel.doIntent(OnAddAddressEvent());
                      resetControllers();
                    }
                  }
                },
                child: isUpdateMode
                    ? Text(AppLocalizations.of(context).updateAddress)
                    : Text(AppLocalizations.of(context).saveAddress),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
