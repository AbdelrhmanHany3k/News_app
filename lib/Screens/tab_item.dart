import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponse.dart';

class TabItem extends StatelessWidget {
  final Sources source;

  const TabItem({required this.source, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        source.name ?? "",
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
