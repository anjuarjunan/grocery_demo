// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_demo/api_grocery/grocery_services.dart';
import 'package:grocery_demo/common/utils.dart';
import 'package:grocery_demo/data/notifier.dart';
import 'package:grocery_demo/data/provider.dart';
import 'package:grocery_demo/models/grocery.response.dart';
import 'package:grocery_demo/screens/grocery_list.dart';

import 'package:grocery_demo/widgets/grocery_item.dart';

void main() {
  testWidgets('GroceryItem displays data correctly and toggles status',
      (tester) async {
    const testItem = GroceryResponse(
      id: '1',
      name: 'Milk',
      category: 'Dairy',
      description: 'Fresh whole milk, 1L',
      status: 'Pending',
    );

    final fakeNotifier = FakeNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          groceryListNotifierProvider.overrideWith((_) => fakeNotifier),
        ],
        child: const MaterialApp(
          home: GroceryItem(groceryItem: testItem),
        ),
      ),
    );

    // Verify visible elements
    expect(find.text('Milk'), findsOneWidget);
    expect(find.text('Dairy'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);
    expect(find.text(getEmoji('Dairy')), findsOneWidget);

    // Tap checkbox
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    // Verify notifier was called
    expect(fakeNotifier.toggledItem, equals(testItem));
  });
  testWidgets('GroceryList allows filtering categories via bottom modal',
      (tester) async {
    final container = ProviderContainer();

    // Pump GroceryList wrapped with Provider scope
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: GroceryList(),
        ),
      ),
    );

    // Tap the filter icon button to open the bottom modal sheet
    await tester.tap(find.byIcon(Icons.filter_alt_outlined));
    await tester.pumpAndSettle();

    // Verify the modal sheet is open by finding the 'Fruits' chip
    expect(find.text('Fruits'), findsOneWidget);

    // Tap the 'Fruits' chip
    await tester.tap(find.text('Fruits'));
    await tester.pumpAndSettle();

    // Modal should be closed after tap (no 'Fruits' chip visible)
    expect(find.text('Fruits'), findsNothing);

    // Verify the provider's state has updated to 'Fruits'
    expect(container.read(selectedCategoryProvider), 'Fruits');

    // Optionally, open the modal again to test clearing filter
    await tester.tap(find.byIcon(Icons.filter_alt_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Clear Filter'), findsOneWidget);

    // Tap "Clear Filter" button
    await tester.tap(find.text('Clear Filter'));
    await tester.pumpAndSettle();

    // Modal closed after clearing filter
    expect(find.text('Clear Filter'), findsNothing);

    // Provider state should now be null (filter cleared)
    expect(container.read(selectedCategoryProvider), isNull);
  });

  testWidgets('GroceryList shows list of items', (tester) async {
    final container = ProviderContainer(overrides: [
      filteredGroceryListProvider
          .overrideWith(((ref) => AsyncValue.data(mockFilteredList))),
      selectedCategoryProvider.overrideWith(
        (ref) => null,
      )
    ]);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: GroceryList()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Milk'), findsOneWidget);
    expect(find.text('Bread'), findsOneWidget);
    expect(find.text('Carrot'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.filter_alt_outlined));
    await tester.pumpAndSettle();
  });
}

// Mock grocery items for testing
final mockFilteredList = [
  const GroceryResponse(
      id: '1', name: 'Apple', category: 'Fruits', description: '', status: ''),
  const GroceryResponse(
      id: '2', name: 'Milk', category: 'Dairy', status: '', description: ''),
  const GroceryResponse(
      id: '3', name: 'Bread', category: 'Bakery', description: '', status: ''),
  const GroceryResponse(
      id: '4',
      name: 'Carrot',
      category: 'Vegetables',
      description: '',
      status: ''),
];

class FakeNotifier extends GroceryListNotifier {
  GroceryResponse? toggledItem;
  FakeNotifier() : super(ApiService()) {
    state = AsyncValue.data(mockFilteredList);
  }
  @override
  void toggleStatus(GroceryResponse item) {
    toggledItem = item;
    super.toggleStatus(item);
  }
}
