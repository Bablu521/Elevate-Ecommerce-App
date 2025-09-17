import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_events.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_states.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/address/views/widgets/saved_address_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedAddressViewBody extends StatefulWidget {
  const SavedAddressViewBody({super.key});

  @override
  State<SavedAddressViewBody> createState() => _SavedAddressViewBodyState();
}

class _SavedAddressViewBodyState extends State<SavedAddressViewBody> {
  @override
  void initState() {
    super.initState();
    addressViewModel.doIntent(OnLoadLoggedUserAddressesEvent());
  }

  final AddressViewModel addressViewModel = getIt.get<AddressViewModel>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            BlocBuilder<AddressViewModel, AddressStates>(
              bloc: addressViewModel,
              builder: (context, state) {
                if (state.addressListIsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.addressListErrorMessage != null) {
                  return Center(child: Text(state.addressListErrorMessage!));
                } else {
                  final List<AddressEntity> addressList =
                      state.addressListSuccess;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: addressList.length,
                    itemBuilder: (context, index) {
                      return SavedAddressListViewItem(
                        address: addressList[index],
                        addressViewModel: addressViewModel,
                      );
                    },
                  );
                }
              },
            ),
            SizedBox(height: 40.h),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, RouteNames.addAddress);
                },
                child: Text(AppLocalizations.of(context).addNewAddress),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
