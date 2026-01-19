import 'package:flutter/material.dart';
import '../models/category_item.dart';

class SubmenuItems extends StatelessWidget {
  final CategoryItem category;

  const SubmenuItems({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      color: Colors.blueGrey.shade50,
      child: Column(
        children: category.subItems.asMap().entries.map((entry) {
          final isLast = entry.key == category.subItems.length - 1;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: isLast ? null : Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  entry.value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

