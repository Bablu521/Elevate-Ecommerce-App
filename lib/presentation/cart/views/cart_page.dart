import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).cart,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
