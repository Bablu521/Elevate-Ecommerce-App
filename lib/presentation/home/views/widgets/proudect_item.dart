import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  const ProductItem(
      {super.key,
        required this.imageUrl,
        required this.title,
        required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl,
                height: 140, width: 150, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,),
          Text(price, style: const TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}