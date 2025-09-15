import 'package:elevate_ecommerce_app/core/utils/validations.dart';
import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressForm extends StatelessWidget {
  final AddressViewModel addressViewModel;
  final VoidCallback validateForm;
  const AddAddressForm({super.key,required this.addressViewModel,required this.validateForm});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addressViewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: validateForm,
      child: Column(
        children: [
          TextFormField(
            controller: addressViewModel.addressContoller,
            validator: Validations.validateAddress,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).address,
              hintText: AppLocalizations.of(context).enterTheAddress,
            ),
          ),
          SizedBox(height: 24.h),
          TextFormField(
            controller: addressViewModel.phoneNumberContoller,
            validator: Validations.validatePhoneNumber,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).phoneNumber,
              hintText: AppLocalizations.of(context).enterPhoneNumber,
            ),
          ),
          SizedBox(height: 24.h),
          TextFormField(
            controller: addressViewModel.recipientNameContoller,
            validator: Validations.validateRecipientName,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).recipientName,
              hintText: AppLocalizations.of(context).enterTheRecipientName,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: ValueListenableBuilder<List<CityEntity>>(
                  valueListenable: addressViewModel.cities,
                  builder: (context, cities, child) {
                    return DropdownButtonFormField<String>(
                      key: ValueKey(AppLocalizations.of(context).cityDropdown),
                      value: addressViewModel.getValidCityId(),
                      isExpanded: true,
                      style: Theme.of(context).textTheme.bodySmall,
                      validator: Validations.validateDropdown,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).city,
                      ),
                      onChanged: (cityId) async {
                        if (cityId != null) {
                          await addressViewModel.onCitySelected(cityId);
                          addressViewModel.selectedCity = cities
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
                  valueListenable: addressViewModel.areas,
                  builder: (context, areas, child) {
                    return DropdownButtonFormField<String>(
                      key: ValueKey(
                        '${AppLocalizations.of(context).areaDropdown}${areas.hashCode}',
                      ),
                      value: addressViewModel.getValidAreaId(),
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
                                addressViewModel.onAreaSelected(areaId);
                              }
                            },
                      items: areas
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item.id,
                              child: Text(
                                item.nameEn??"",
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
    );
  }
}
