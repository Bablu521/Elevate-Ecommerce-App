
import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/presentation/main_home/main_provider/controller_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;
  final String categoryId;
  const CategoryItem({
    super.key,
    required this.image,
    required this.label,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.changeSelectedCategory(categoryId);
        provider.changePage(1);
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ImageIcon(
                  NetworkImage(image),
                  size: 30,
                  color: AppColors.red,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
