import 'package:elevate_ecommerce_app/presentation/notifications/view/widgets/custom_item_notification.dart';
import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => const CustomItemNotification(),
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
