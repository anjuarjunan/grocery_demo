import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_demo/models/grocery.response.dart';

import '../common/utils.dart';
import '../data/provider.dart';

class GroceryItem extends ConsumerWidget {
  final GroceryResponse groceryItem;

  const GroceryItem({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isBought = groceryItem.status == 'Bought';
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Row(mainAxisSize: MainAxisSize.min, children: [
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            side: const BorderSide(width: 1, color: Color(0xff9ca3af)),
            value: isBought,
            onChanged: (_) {
              ref
                  .read(groceryListNotifierProvider.notifier)
                  .toggleStatus(groceryItem);
            },
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:
                  isBought ? const Color(0x4410B981) : const Color(0x449ca3af),
            ),
            child: Text(
              getEmoji(groceryItem.category),
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ]),
        tileColor: Colors.white,
        title: Text(
          groceryItem.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              decoration:
                  isBought ? TextDecoration.lineThrough : TextDecoration.none,
              color: const Color(0xFF111827),
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.8, horizontal: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD1D5DB)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    groceryItem.category,
                    style: const TextStyle(
                        color: Color(0xFF374151),
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                  decoration: BoxDecoration(
                    color: isBought
                        ? const Color(0xFF10B981)
                        : const Color(0xFFEF4444),
                    borderRadius: BorderRadius.circular(10000),
                  ),
                  child: Text(
                    groceryItem.status,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              groceryItem.description ?? '',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
