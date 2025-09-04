// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grocery.response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroceryResponse _$GroceryResponseFromJson(Map<String, dynamic> json) {
  return _GroceryResponse.fromJson(json);
}

/// @nodoc
mixin _$GroceryResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroceryResponseCopyWith<GroceryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryResponseCopyWith<$Res> {
  factory $GroceryResponseCopyWith(
          GroceryResponse value, $Res Function(GroceryResponse) then) =
      _$GroceryResponseCopyWithImpl<$Res, GroceryResponse>;
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      String? description,
      String status});
}

/// @nodoc
class _$GroceryResponseCopyWithImpl<$Res, $Val extends GroceryResponse>
    implements $GroceryResponseCopyWith<$Res> {
  _$GroceryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? description = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroceryResponseImplCopyWith<$Res>
    implements $GroceryResponseCopyWith<$Res> {
  factory _$$GroceryResponseImplCopyWith(_$GroceryResponseImpl value,
          $Res Function(_$GroceryResponseImpl) then) =
      __$$GroceryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      String? description,
      String status});
}

/// @nodoc
class __$$GroceryResponseImplCopyWithImpl<$Res>
    extends _$GroceryResponseCopyWithImpl<$Res, _$GroceryResponseImpl>
    implements _$$GroceryResponseImplCopyWith<$Res> {
  __$$GroceryResponseImplCopyWithImpl(
      _$GroceryResponseImpl _value, $Res Function(_$GroceryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? description = freezed,
    Object? status = null,
  }) {
    return _then(_$GroceryResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroceryResponseImpl implements _GroceryResponse {
  const _$GroceryResponseImpl(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.status});

  factory _$GroceryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroceryResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  @override
  final String? description;
  @override
  final String status;

  @override
  String toString() {
    return 'GroceryResponse(id: $id, name: $name, category: $category, description: $description, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceryResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, category, description, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroceryResponseImplCopyWith<_$GroceryResponseImpl> get copyWith =>
      __$$GroceryResponseImplCopyWithImpl<_$GroceryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroceryResponseImplToJson(
      this,
    );
  }
}

abstract class _GroceryResponse implements GroceryResponse {
  const factory _GroceryResponse(
      {required final String id,
      required final String name,
      required final String category,
      required final String? description,
      required final String status}) = _$GroceryResponseImpl;

  factory _GroceryResponse.fromJson(Map<String, dynamic> json) =
      _$GroceryResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get category;
  @override
  String? get description;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$GroceryResponseImplCopyWith<_$GroceryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
