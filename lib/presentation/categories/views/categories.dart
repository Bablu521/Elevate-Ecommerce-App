import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Center(child:Text(AppLocalizations.of(context).categories,
          style: TextStyle(color: Colors.black),

        ),
    );
  }
}
