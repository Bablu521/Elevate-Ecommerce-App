import 'package:elevate_ecommerce_app/api/data_source/auth_local_data_source_impl.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileRow extends StatelessWidget {
  Widget icon1, icon2;
  String text;
  ProfileRow({required this.icon1, required this.icon2, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon1,
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            fontFamily: "Inter",
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            await AuthLocalDataSourceImpl(
              getIt.get<FlutterSecureStorage>(),
            ).userLogout();
            Navigator.pushReplacementNamed(context, RouteNames.login);
          },
          child: icon2,
        ),
      ],
    );
  }
}
