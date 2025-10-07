import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponse.dart';

class TabItem extends StatelessWidget {
  final Sources source;
  final bool isSelected;

  const TabItem({required this.source, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.white,
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.white : Colors.green,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}