import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/provider.dart';
import '../models/grocery.response.dart';

class AddItemDialog extends ConsumerStatefulWidget {
  const AddItemDialog({super.key});

  @override
  ConsumerState<AddItemDialog> createState() => AddItemDialogState();
}

class AddItemDialogState extends ConsumerState<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();

  final List<String> category = [
    "Dairy",
    "Fruits",
    "Vegetables",
    "Bakery",
    "Meat",
    "Pantry"
  ];
  final List<String> status = ['Bought', 'Pending'];
  String? selectedCategory;
  String? selectedStatus;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  void addItem() {
    if (_formKey.currentState!.validate()) {
      final newItem = GroceryResponse(
        name: _nameController.text,
        category: selectedCategory ?? '',
        status: selectedStatus ?? 'Pending',
        description: _descriptionController.text,
        id: '',
      );

      ref
          .read(groceryListNotifierProvider.notifier)
          .addItem(newItem); //access provider using notifier

      _nameController.clear();
      _descriptionController.clear();
      selectedCategory = null;
      selectedStatus = null;

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      titlePadding: const EdgeInsets.only(top: 16, left: 16, right: 8),
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart,
                color: Colors.deepPurple, size: 20),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Text(
              'Add New Item',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelAsterisk(label: 'Item Name'),
                const SizedBox(height: 4),
                TextFormField(
                  controller: _nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: Theme.of(context).textTheme.labelSmall,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    isDense: true,
                    label: Text(
                      'Enter item name',
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const LabelAsterisk(label: 'Category'),
                const SizedBox(height: 4),
                DropdownButtonFormField<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  value: selectedCategory,
                  isDense: true,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  validator: (value) =>
                      value == null ? 'Please select a category' : null,
                  decoration: const InputDecoration(
                    labelText: 'Select Category',
                  ),
                  items: category.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          category,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                const SizedBox(height: 6),
                const Text('Description',
                    style: TextStyle(color: Colors.black, fontSize: 10)),
                const SizedBox(height: 4),
                TextField(
                  controller: _descriptionController,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  maxLines: 3,
                  decoration: const InputDecoration(
                    label: Text('Enter item description (optional)'),
                  ),
                ),
                const SizedBox(height: 6),
                const Text('Status',
                    style: TextStyle(color: Colors.black, fontSize: 10)),
                const SizedBox(height: 4),
                DropdownButtonFormField<String>(
                  isDense: true,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  value: selectedStatus,
                  decoration: const InputDecoration(
                    labelText: 'Select Status',
                  ),
                  items: status.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: Text(
                          status,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedStatus = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FilledButton(
            style: FilledButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: addItem,
            child: const Text('Add item')),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}

class LabelAsterisk extends StatelessWidget {
  final String label;

  const LabelAsterisk({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: '$label ',
            style: const TextStyle(color: Colors.black, fontSize: 10)),
        const TextSpan(
            text: '*', style: TextStyle(color: Colors.red, fontSize: 10)),
      ]),
    );
  }
}
