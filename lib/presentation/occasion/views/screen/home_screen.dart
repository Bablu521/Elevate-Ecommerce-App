import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  


  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Occasions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    // Navigate with null occasionId ("See All")
                    Navigator.pushNamed(
                      context,
                      RouteNames.occasion,
                      arguments: null,
                    );
                  },
                  child: const Text("See All"),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigate with null occasionId ("See All")
              Navigator.pushNamed(context, RouteNames.occasion, arguments: "673b351e1159920171827ae5",
              );
            },
            child: const Text("Occasion"),
          ),
        ],
      ),
    );
  }
}
