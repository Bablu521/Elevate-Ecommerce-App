import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Center(child:Text(AppLocalizations.of(context).cart,
          style: TextStyle(color: Colors.black),

        ),
    );
  }
}
