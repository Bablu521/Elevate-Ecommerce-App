import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/address/views/widgets/add_address_view_body.dart';
import 'package:flutter/material.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const SafeArea(child: AddAddressViewBody()),
    );
  }
}
