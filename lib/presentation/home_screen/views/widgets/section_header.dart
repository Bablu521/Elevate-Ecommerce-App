import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  VoidCallback onTap;
   SectionHeader({ required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text("View All" , style: TextStyle(
            decoration: TextDecoration.underline
          ),),
        ),
      ],
    );
  }
}