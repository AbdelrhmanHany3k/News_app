import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(categoryModel.image),
          fit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(Colors.black26, BlendMode.darken), // slight dark overlay
        ),
      ),
      child: Center(
        child: Text(
          categoryModel.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
