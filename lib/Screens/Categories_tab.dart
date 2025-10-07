import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryModel.dart';
import 'package:news_app/Screens/Category_item.dart';

class CategoriesTab extends StatelessWidget {
  static const String routename = "categories";
  Function onClicked;

  CategoriesTab({super.key, required this.onClicked});

  final List<CategoryModel> categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pick your category of interest",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap:() {
                      onClicked(categories[index]);
                    },
                    child: CategoryItem(categoryModel: categories[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}