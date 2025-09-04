import 'package:grocery_demo/api_grocery/grocery_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_demo/models/grocery.response.dart';

import 'notifier.dart';

final groceryApiProvider = Provider<ApiService>((ref) {
  return ApiService();
});
final groceryListNotifierProvider = StateNotifierProvider<GroceryListNotifier,
    AsyncValue<List<GroceryResponse>>>(
  (ref) => GroceryListNotifier(ref.watch(groceryApiProvider)),
);

//selected category for filter
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

//filtered product list provider

final filteredGroceryListProvider =
    Provider<AsyncValue<List<GroceryResponse>>>((ref) {
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final groceryListAsync = ref.watch(groceryListNotifierProvider);

  return groceryListAsync.when(
    data: (items) {
      if (selectedCategory == null) return AsyncValue.data(items);
      final filtered =
          items.where((item) => item.category == selectedCategory).toList();
      return AsyncValue.data(filtered);
    },
    loading: () => const AsyncValue.loading(),
    error: (err, stack) => AsyncValue.error(err, stack),
  );
});
