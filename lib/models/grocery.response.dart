import 'package:freezed_annotation/freezed_annotation.dart';

part 'grocery.response.freezed.dart';
part 'grocery.response.g.dart';

@freezed
class GroceryResponse with _$GroceryResponse {
  const factory GroceryResponse({
    required String id,
    required String name,
    required String category,
    required String? description,
    required String status,
  }) = _GroceryResponse;
  factory GroceryResponse.fromJson(Map<String, dynamic> json) =>
      _$GroceryResponseFromJson(json);
}
