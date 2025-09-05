import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_demo/screens/add_item.dart';
import 'package:grocery_demo/widgets/grocery_item.dart';
import '../data/provider.dart';
import '../widgets/category_filter.dart';

class GroceryList extends ConsumerWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredListAsync = ref.watch(filteredGroceryListProvider);

    return Scaffold(
      appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Grocery List',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.deepPurple,
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (_) => const CategoryFilter(),
              ),
              icon: const Icon(Icons.filter_alt_outlined),
            )
          ]),
      body: filteredListAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No items found'));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final groceryItem = items[index];
                return GroceryItem(groceryItem: groceryItem);
              },
              itemCount: items.length,
            ),
          );
        },
        error: (err, stack) => const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Something went wrong'),
              Icon(Icons.error_outline),
            ],
          ),
        ),
        loading: () => const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.black,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) => const AddItemDialog(),
          );
        },
        tooltip: 'add more',
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
