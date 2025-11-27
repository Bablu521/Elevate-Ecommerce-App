import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_states.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/address/views/widgets/add_address_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressView extends StatelessWidget {
  final AddressEntity? addressEntity;
  AddAddressView({super.key, this.addressEntity});

  final AddressViewModel addressViewModel = getIt.get<AddressViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressViewModel, AddressStates>(
      bloc: addressViewModel,
      listener: (context, state) {
        if (state.addressListIsLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
          if (Navigator.canPop(context)) Navigator.pop(context);

          if (state.addressListErrorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.addressListErrorMessage!)),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state.addressListSuccess.isNotEmpty &&
              state.addressAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    AppLocalizations.of(context).addressAddedSuccessfully,
                  ),
                ),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state.addressListSuccess.isNotEmpty &&
              state.addressUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    AppLocalizations.of(context).addressUpdatedSuccessfully,
                  ),
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            AppLocalizations.of(context).address,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: AddAddressViewBody(
            addressViewModel: addressViewModel,
            addressEntity: addressEntity,
          ),
        ),
      ),
    );
  }
}
