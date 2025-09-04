import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_demo/screens/grocery_list.dart';
import 'package:grocery_demo/theme/app_theme.dart';

void main() {
  runApp(
    ProviderScope(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const GroceryList(),
    )),
  );
}
