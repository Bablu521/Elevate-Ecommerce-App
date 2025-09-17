import 'package:flutter/material.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({super.key});

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Switch(
        value: isOn,
        onChanged: (value) {
          setState(() {
            isOn = value;
          });
        },
        activeThumbColor: Colors.transparent,
        activeTrackColor: Colors.pink,
      ),
    );
  }
}
