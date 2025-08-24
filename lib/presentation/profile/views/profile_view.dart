import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  String? userStatus;
  @override
  void initState() {
    getUserStatus();
    super.initState();
  }

  Future<void> getUserStatus() async {
    final FlutterSecureStorage secureStorage =
        getIt.get<FlutterSecureStorage>();
    final String? status = await secureStorage.read(
      key: ConstKeys.keyUserStatus,
    );
    setState(() {
      userStatus = status ?? "Loading....";
    });
  }

  Future<void> logout() async {
    final FlutterSecureStorage secureStorage =
        getIt.get<FlutterSecureStorage>();
    secureStorage.write(key: ConstKeys.keyRememberMe, value: false.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(child: Text(AppLocalizations.of(context).profile)),
            Text("user Status  : $userStatus"),
            ElevatedButton(
              onPressed: () {
                logout();
                Navigator.pushReplacementNamed(context, RouteNames.login);
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
