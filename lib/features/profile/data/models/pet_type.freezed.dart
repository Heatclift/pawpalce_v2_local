// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PetType _$PetTypeFromJson(Map<String, dynamic> json) {
  return _PetType.fromJson(json);
}

/// @nodoc
mixin _$PetType {
  int get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetTypeCopyWith<PetType> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetTypeCopyWith<$Res> {
  factory $PetTypeCopyWith(PetType value, $Res Function(PetType) then) =
      _$PetTypeCopyWithImpl<$Res, PetType>;
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class _$PetTypeCopyWithImpl<$Res, $Val extends PetType>
    implements $PetTypeCopyWith<$Res> {
  _$PetTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetTypeImplCopyWith<$Res> implements $PetTypeCopyWith<$Res> {
  factory _$$PetTypeImplCopyWith(
          _$PetTypeImpl value, $Res Function(_$PetTypeImpl) then) =
      __$$PetTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class __$$PetTypeImplCopyWithImpl<$Res>
    extends _$PetTypeCopyWithImpl<$Res, _$PetTypeImpl>
    implements _$$PetTypeImplCopyWith<$Res> {
  __$$PetTypeImplCopyWithImpl(
      _$PetTypeImpl _value, $Res Function(_$PetTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$PetTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetTypeImpl implements _PetType {
  const _$PetTypeImpl({required this.id, required this.label});

  factory _$PetTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetTypeImplFromJson(json);

  @override
  final int id;
  @override
  final String label;

  @override
  String toString() {
    return 'PetType(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetTypeImplCopyWith<_$PetTypeImpl> get copyWith =>
      __$$PetTypeImplCopyWithImpl<_$PetTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetTypeImplToJson(
      this,
    );
  }
}

abstract class _PetType implements PetType {
  const factory _PetType({required final int id, required final String label}) =
      _$PetTypeImpl;

  factory _PetType.fromJson(Map<String, dynamic> json) = _$PetTypeImpl.fromJson;

  @override
  int get id;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$PetTypeImplCopyWith<_$PetTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
