import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String id;
  Color color;
  String image;

  CategoryModel(
      {required this.name,
      required this.id,
      required this.color,
      required this.image});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          name: "Sports",
          id: "sports",
          color: const Color(0xFFC91C22),
          image: "assets/images/sports.png"),
      CategoryModel(
          name: "General",
          id: "general",
          color: const Color(0xFF003E90),
          image: "assets/images/Politics.png"),
      CategoryModel(
          name: "Health",
          id: "health",
          color: const Color(0xFFED1E79),
          image: "assets/images/health.png"),
      CategoryModel(
          name: "business",
          id: "business",
          color: const Color(0xFFCF7E48),
          image: "assets/images/bussines.png"),
      CategoryModel(
          name: "Entertainment",
          id: "entertainment",
          color: const Color(0xFF4882CF),
          image: "assets/images/environment.png"),
      CategoryModel(
          name: "Science",
          id: "science",
          color: const Color(0xFFF2D352),
          image: "assets/images/science.png"),
    ];
  }
}
