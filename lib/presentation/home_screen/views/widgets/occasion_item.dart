import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccasionItem extends StatelessWidget {
  final String imageUrl;
  final String label;
  const OccasionItem({super.key, required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl,
                height: 120, width: 140, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(label, style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis
          )
          ,
          ),
        ],
      ),
    );
  }}