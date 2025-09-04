import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_grocery/grocery_services.dart';
import '../models/grocery.response.dart';

class GroceryListNotifier
    extends StateNotifier<AsyncValue<List<GroceryResponse>>> {
  final ApiService api;

  GroceryListNotifier(this.api) : super(const AsyncValue.loading()) {
    _loadGroceryList();
  }

  Future<void> _loadGroceryList() async {
    try {
      final items = await api.retrieveGroceryList();
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void addItem(GroceryResponse item) {
    state.whenData((items) {
      state = AsyncValue.data([...items, item]);
    });
  }

  void toggleStatus(GroceryResponse item) {
    state.whenData((items) {
      final updatedItem = item.copyWith(
        status: item.status == 'Bought' ? 'Pending' : 'Bought',
      );

      final updatedList = items.map((i) {
        return i.id == item.id ? updatedItem : i;
      }).toList();

      state = AsyncValue.data(updatedList);
    });
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await _loadGroceryList();
  }
}
