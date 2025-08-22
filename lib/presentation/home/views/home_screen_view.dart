import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Center(child:Text(AppLocalizations.of(context).home,
        style: TextStyle(color: Colors.black),
        ),
    );
  }
}
