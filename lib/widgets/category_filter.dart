import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/provider.dart';

class CategoryFilter extends ConsumerWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedCategoryProvider);
    final categories = [
      'Dairy',
      'Fruits',
      'Vegetables',
      'Bakery',
      'Meat',
      'Pantry'
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filter by Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 12,
            children: categories.map((category) {
              final isSelected = selected == category;
              return ChoiceChip(
                side: const BorderSide(width: 1, color: Color(0xff9ca3af)),
                key: ValueKey(category),
                label: Text(category),
                selected: isSelected,
                onSelected: (_) {
                  ref.read(selectedCategoryProvider.notifier).state =
                      isSelected ? null : category;
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              ref.read(selectedCategoryProvider.notifier).state = null;
              Navigator.pop(context);
            },
            child: const Text('Clear Filter'),
          )
        ],
      ),
    );
  }
}
