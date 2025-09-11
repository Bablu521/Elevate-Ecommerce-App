import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Center(child:Text(AppLocalizations.of(context).profile),);

  }
}
