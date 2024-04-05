// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSession _$UserSessionFromJson(Map<String, dynamic> json) {
  return _UserSession.fromJson(json);
}

/// @nodoc
mixin _$UserSession {
  @HiveField(01)
  String? get idToken => throw _privateConstructorUsedError;
  @HiveField(04)
  String? get localId => throw _privateConstructorUsedError;
  @HiveField(05)
  bool get isNewUser => throw _privateConstructorUsedError;
  @HiveField(06)
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSessionCopyWith<UserSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSessionCopyWith<$Res> {
  factory $UserSessionCopyWith(
          UserSession value, $Res Function(UserSession) then) =
      _$UserSessionCopyWithImpl<$Res, UserSession>;
  @useResult
  $Res call(
      {@HiveField(01) String? idToken,
      @HiveField(04) String? localId,
      @HiveField(05) bool isNewUser,
      @HiveField(06) String phoneNumber});
}

/// @nodoc
class _$UserSessionCopyWithImpl<$Res, $Val extends UserSession>
    implements $UserSessionCopyWith<$Res> {
  _$UserSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
    Object? localId = freezed,
    Object? isNewUser = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSessionImplCopyWith<$Res>
    implements $UserSessionCopyWith<$Res> {
  factory _$$UserSessionImplCopyWith(
          _$UserSessionImpl value, $Res Function(_$UserSessionImpl) then) =
      __$$UserSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(01) String? idToken,
      @HiveField(04) String? localId,
      @HiveField(05) bool isNewUser,
      @HiveField(06) String phoneNumber});
}

/// @nodoc
class __$$UserSessionImplCopyWithImpl<$Res>
    extends _$UserSessionCopyWithImpl<$Res, _$UserSessionImpl>
    implements _$$UserSessionImplCopyWith<$Res> {
  __$$UserSessionImplCopyWithImpl(
      _$UserSessionImpl _value, $Res Function(_$UserSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
    Object? localId = freezed,
    Object? isNewUser = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$UserSessionImpl(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSessionImpl extends _UserSession {
  const _$UserSessionImpl(
      {@HiveField(01) required this.idToken,
      @HiveField(04) required this.localId,
      @HiveField(05) required this.isNewUser,
      @HiveField(06) required this.phoneNumber})
      : super._();

  factory _$UserSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSessionImplFromJson(json);

  @override
  @HiveField(01)
  final String? idToken;
  @override
  @HiveField(04)
  final String? localId;
  @override
  @HiveField(05)
  final bool isNewUser;
  @override
  @HiveField(06)
  final String phoneNumber;

  @override
  String toString() {
    return 'UserSession(idToken: $idToken, localId: $localId, isNewUser: $isNewUser, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSessionImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idToken, localId, isNewUser, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSessionImplCopyWith<_$UserSessionImpl> get copyWith =>
      __$$UserSessionImplCopyWithImpl<_$UserSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSessionImplToJson(
      this,
    );
  }
}

abstract class _UserSession extends UserSession {
  const factory _UserSession(
      {@HiveField(01) required final String? idToken,
      @HiveField(04) required final String? localId,
      @HiveField(05) required final bool isNewUser,
      @HiveField(06) required final String phoneNumber}) = _$UserSessionImpl;
  const _UserSession._() : super._();

  factory _UserSession.fromJson(Map<String, dynamic> json) =
      _$UserSessionImpl.fromJson;

  @override
  @HiveField(01)
  String? get idToken;
  @override
  @HiveField(04)
  String? get localId;
  @override
  @HiveField(05)
  bool get isNewUser;
  @override
  @HiveField(06)
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$UserSessionImplCopyWith<_$UserSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
