import 'package:flutter/cupertino.dart';

class ProfileRow extends StatelessWidget {

  Widget icon1, icon2;
  String text;
   ProfileRow({required this.icon1,
    required this.icon2,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon1,
        const SizedBox(width: 8,),
        Text(text,style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          fontFamily: "Inter"
        ),),
        const Spacer(),
        icon2

      ],
    );
  }
}
