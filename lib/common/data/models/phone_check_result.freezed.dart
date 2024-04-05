// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_check_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhoneCheckResult _$PhoneCheckResultFromJson(Map<String, dynamic> json) {
  return _PhoneCheckResult.fromJson(json);
}

/// @nodoc
mixin _$PhoneCheckResult {
  bool get isExist => throw _privateConstructorUsedError;
  int get role => throw _privateConstructorUsedError;
  bool get isProfileUpdated => throw _privateConstructorUsedError;
  int get otpCountRequest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneCheckResultCopyWith<PhoneCheckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneCheckResultCopyWith<$Res> {
  factory $PhoneCheckResultCopyWith(
          PhoneCheckResult value, $Res Function(PhoneCheckResult) then) =
      _$PhoneCheckResultCopyWithImpl<$Res, PhoneCheckResult>;
  @useResult
  $Res call(
      {bool isExist, int role, bool isProfileUpdated, int otpCountRequest});
}

/// @nodoc
class _$PhoneCheckResultCopyWithImpl<$Res, $Val extends PhoneCheckResult>
    implements $PhoneCheckResultCopyWith<$Res> {
  _$PhoneCheckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExist = null,
    Object? role = null,
    Object? isProfileUpdated = null,
    Object? otpCountRequest = null,
  }) {
    return _then(_value.copyWith(
      isExist: null == isExist
          ? _value.isExist
          : isExist // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      isProfileUpdated: null == isProfileUpdated
          ? _value.isProfileUpdated
          : isProfileUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      otpCountRequest: null == otpCountRequest
          ? _value.otpCountRequest
          : otpCountRequest // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneCheckResultImplCopyWith<$Res>
    implements $PhoneCheckResultCopyWith<$Res> {
  factory _$$PhoneCheckResultImplCopyWith(_$PhoneCheckResultImpl value,
          $Res Function(_$PhoneCheckResultImpl) then) =
      __$$PhoneCheckResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isExist, int role, bool isProfileUpdated, int otpCountRequest});
}

/// @nodoc
class __$$PhoneCheckResultImplCopyWithImpl<$Res>
    extends _$PhoneCheckResultCopyWithImpl<$Res, _$PhoneCheckResultImpl>
    implements _$$PhoneCheckResultImplCopyWith<$Res> {
  __$$PhoneCheckResultImplCopyWithImpl(_$PhoneCheckResultImpl _value,
      $Res Function(_$PhoneCheckResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExist = null,
    Object? role = null,
    Object? isProfileUpdated = null,
    Object? otpCountRequest = null,
  }) {
    return _then(_$PhoneCheckResultImpl(
      isExist: null == isExist
          ? _value.isExist
          : isExist // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      isProfileUpdated: null == isProfileUpdated
          ? _value.isProfileUpdated
          : isProfileUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      otpCountRequest: null == otpCountRequest
          ? _value.otpCountRequest
          : otpCountRequest // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneCheckResultImpl implements _PhoneCheckResult {
  _$PhoneCheckResultImpl(
      {this.isExist = false,
      required this.role,
      this.isProfileUpdated = false,
      this.otpCountRequest = 0});

  factory _$PhoneCheckResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneCheckResultImplFromJson(json);

  @override
  @JsonKey()
  final bool isExist;
  @override
  final int role;
  @override
  @JsonKey()
  final bool isProfileUpdated;
  @override
  @JsonKey()
  final int otpCountRequest;

  @override
  String toString() {
    return 'PhoneCheckResult(isExist: $isExist, role: $role, isProfileUpdated: $isProfileUpdated, otpCountRequest: $otpCountRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneCheckResultImpl &&
            (identical(other.isExist, isExist) || other.isExist == isExist) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isProfileUpdated, isProfileUpdated) ||
                other.isProfileUpdated == isProfileUpdated) &&
            (identical(other.otpCountRequest, otpCountRequest) ||
                other.otpCountRequest == otpCountRequest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isExist, role, isProfileUpdated, otpCountRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneCheckResultImplCopyWith<_$PhoneCheckResultImpl> get copyWith =>
      __$$PhoneCheckResultImplCopyWithImpl<_$PhoneCheckResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneCheckResultImplToJson(
      this,
    );
  }
}

abstract class _PhoneCheckResult implements PhoneCheckResult {
  factory _PhoneCheckResult(
      {final bool isExist,
      required final int role,
      final bool isProfileUpdated,
      final int otpCountRequest}) = _$PhoneCheckResultImpl;

  factory _PhoneCheckResult.fromJson(Map<String, dynamic> json) =
      _$PhoneCheckResultImpl.fromJson;

  @override
  bool get isExist;
  @override
  int get role;
  @override
  bool get isProfileUpdated;
  @override
  int get otpCountRequest;
  @override
  @JsonKey(ignore: true)
  _$$PhoneCheckResultImplCopyWith<_$PhoneCheckResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
