// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PetProfile _$PetProfileFromJson(Map<String, dynamic> json) {
  return _PetProfile.fromJson(json);
}

/// @nodoc
mixin _$PetProfile {
  String? get petId => throw _privateConstructorUsedError;
  String? get petName => throw _privateConstructorUsedError;
  String? get petPhotoUrl => throw _privateConstructorUsedError;
  String? get petOwnerId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get updateAt => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetProfileCopyWith<PetProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetProfileCopyWith<$Res> {
  factory $PetProfileCopyWith(
          PetProfile value, $Res Function(PetProfile) then) =
      _$PetProfileCopyWithImpl<$Res, PetProfile>;
  @useResult
  $Res call(
      {String? petId,
      String? petName,
      String? petPhotoUrl,
      String? petOwnerId,
      DateTime? createdAt,
      String? createdBy,
      DateTime? updateAt,
      String? updatedBy});
}

/// @nodoc
class _$PetProfileCopyWithImpl<$Res, $Val extends PetProfile>
    implements $PetProfileCopyWith<$Res> {
  _$PetProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? petId = freezed,
    Object? petName = freezed,
    Object? petPhotoUrl = freezed,
    Object? petOwnerId = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updateAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String?,
      petName: freezed == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String?,
      petPhotoUrl: freezed == petPhotoUrl
          ? _value.petPhotoUrl
          : petPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      petOwnerId: freezed == petOwnerId
          ? _value.petOwnerId
          : petOwnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetProfileImplCopyWith<$Res>
    implements $PetProfileCopyWith<$Res> {
  factory _$$PetProfileImplCopyWith(
          _$PetProfileImpl value, $Res Function(_$PetProfileImpl) then) =
      __$$PetProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? petId,
      String? petName,
      String? petPhotoUrl,
      String? petOwnerId,
      DateTime? createdAt,
      String? createdBy,
      DateTime? updateAt,
      String? updatedBy});
}

/// @nodoc
class __$$PetProfileImplCopyWithImpl<$Res>
    extends _$PetProfileCopyWithImpl<$Res, _$PetProfileImpl>
    implements _$$PetProfileImplCopyWith<$Res> {
  __$$PetProfileImplCopyWithImpl(
      _$PetProfileImpl _value, $Res Function(_$PetProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? petId = freezed,
    Object? petName = freezed,
    Object? petPhotoUrl = freezed,
    Object? petOwnerId = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updateAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$PetProfileImpl(
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String?,
      petName: freezed == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String?,
      petPhotoUrl: freezed == petPhotoUrl
          ? _value.petPhotoUrl
          : petPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      petOwnerId: freezed == petOwnerId
          ? _value.petOwnerId
          : petOwnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetProfileImpl implements _PetProfile {
  const _$PetProfileImpl(
      {this.petId,
      this.petName,
      this.petPhotoUrl,
      this.petOwnerId,
      this.createdAt,
      this.createdBy,
      this.updateAt,
      this.updatedBy});

  factory _$PetProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetProfileImplFromJson(json);

  @override
  final String? petId;
  @override
  final String? petName;
  @override
  final String? petPhotoUrl;
  @override
  final String? petOwnerId;
  @override
  final DateTime? createdAt;
  @override
  final String? createdBy;
  @override
  final DateTime? updateAt;
  @override
  final String? updatedBy;

  @override
  String toString() {
    return 'PetProfile(petId: $petId, petName: $petName, petPhotoUrl: $petPhotoUrl, petOwnerId: $petOwnerId, createdAt: $createdAt, createdBy: $createdBy, updateAt: $updateAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetProfileImpl &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.petName, petName) || other.petName == petName) &&
            (identical(other.petPhotoUrl, petPhotoUrl) ||
                other.petPhotoUrl == petPhotoUrl) &&
            (identical(other.petOwnerId, petOwnerId) ||
                other.petOwnerId == petOwnerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, petId, petName, petPhotoUrl,
      petOwnerId, createdAt, createdBy, updateAt, updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetProfileImplCopyWith<_$PetProfileImpl> get copyWith =>
      __$$PetProfileImplCopyWithImpl<_$PetProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetProfileImplToJson(
      this,
    );
  }
}

abstract class _PetProfile implements PetProfile {
  const factory _PetProfile(
      {final String? petId,
      final String? petName,
      final String? petPhotoUrl,
      final String? petOwnerId,
      final DateTime? createdAt,
      final String? createdBy,
      final DateTime? updateAt,
      final String? updatedBy}) = _$PetProfileImpl;

  factory _PetProfile.fromJson(Map<String, dynamic> json) =
      _$PetProfileImpl.fromJson;

  @override
  String? get petId;
  @override
  String? get petName;
  @override
  String? get petPhotoUrl;
  @override
  String? get petOwnerId;
  @override
  DateTime? get createdAt;
  @override
  String? get createdBy;
  @override
  DateTime? get updateAt;
  @override
  String? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$PetProfileImplCopyWith<_$PetProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
