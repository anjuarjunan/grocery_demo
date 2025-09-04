// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroceryResponseImpl _$$GroceryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GroceryResponseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$GroceryResponseImplToJson(
        _$GroceryResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'status': instance.status,
    };
