import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/grocery.response.dart';

class ApiService {
  Future<List<GroceryResponse>> retrieveGroceryList() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/9322afb8-fae1-4e37-9a4b-896a136a4d05'));

    if (response.statusCode == 200) {
      final List json = jsonDecode(response.body);
      return json.map((e) => GroceryResponse.fromJson(e)).toList();
    } else {
      throw Exception('failed to load grocery');
    }
  }
}
