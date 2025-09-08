import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).categories,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
