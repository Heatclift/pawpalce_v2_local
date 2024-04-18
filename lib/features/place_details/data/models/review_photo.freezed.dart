// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewPhoto _$ReviewPhotoFromJson(Map<String, dynamic> json) {
  return _ReviewPhoto.fromJson(json);
}

/// @nodoc
mixin _$ReviewPhoto {
  String get reviewPhotoId => throw _privateConstructorUsedError;
  String get reviewId => throw _privateConstructorUsedError;
  String get reviewPhotoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewPhotoCopyWith<ReviewPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewPhotoCopyWith<$Res> {
  factory $ReviewPhotoCopyWith(
          ReviewPhoto value, $Res Function(ReviewPhoto) then) =
      _$ReviewPhotoCopyWithImpl<$Res, ReviewPhoto>;
  @useResult
  $Res call({String reviewPhotoId, String reviewId, String reviewPhotoUrl});
}

/// @nodoc
class _$ReviewPhotoCopyWithImpl<$Res, $Val extends ReviewPhoto>
    implements $ReviewPhotoCopyWith<$Res> {
  _$ReviewPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewPhotoId = null,
    Object? reviewId = null,
    Object? reviewPhotoUrl = null,
  }) {
    return _then(_value.copyWith(
      reviewPhotoId: null == reviewPhotoId
          ? _value.reviewPhotoId
          : reviewPhotoId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewPhotoUrl: null == reviewPhotoUrl
          ? _value.reviewPhotoUrl
          : reviewPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewPhotoImplCopyWith<$Res>
    implements $ReviewPhotoCopyWith<$Res> {
  factory _$$ReviewPhotoImplCopyWith(
          _$ReviewPhotoImpl value, $Res Function(_$ReviewPhotoImpl) then) =
      __$$ReviewPhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reviewPhotoId, String reviewId, String reviewPhotoUrl});
}

/// @nodoc
class __$$ReviewPhotoImplCopyWithImpl<$Res>
    extends _$ReviewPhotoCopyWithImpl<$Res, _$ReviewPhotoImpl>
    implements _$$ReviewPhotoImplCopyWith<$Res> {
  __$$ReviewPhotoImplCopyWithImpl(
      _$ReviewPhotoImpl _value, $Res Function(_$ReviewPhotoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewPhotoId = null,
    Object? reviewId = null,
    Object? reviewPhotoUrl = null,
  }) {
    return _then(_$ReviewPhotoImpl(
      reviewPhotoId: null == reviewPhotoId
          ? _value.reviewPhotoId
          : reviewPhotoId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewPhotoUrl: null == reviewPhotoUrl
          ? _value.reviewPhotoUrl
          : reviewPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewPhotoImpl implements _ReviewPhoto {
  const _$ReviewPhotoImpl(
      {required this.reviewPhotoId,
      required this.reviewId,
      required this.reviewPhotoUrl});

  factory _$ReviewPhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewPhotoImplFromJson(json);

  @override
  final String reviewPhotoId;
  @override
  final String reviewId;
  @override
  final String reviewPhotoUrl;

  @override
  String toString() {
    return 'ReviewPhoto(reviewPhotoId: $reviewPhotoId, reviewId: $reviewId, reviewPhotoUrl: $reviewPhotoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewPhotoImpl &&
            (identical(other.reviewPhotoId, reviewPhotoId) ||
                other.reviewPhotoId == reviewPhotoId) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.reviewPhotoUrl, reviewPhotoUrl) ||
                other.reviewPhotoUrl == reviewPhotoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reviewPhotoId, reviewId, reviewPhotoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewPhotoImplCopyWith<_$ReviewPhotoImpl> get copyWith =>
      __$$ReviewPhotoImplCopyWithImpl<_$ReviewPhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewPhotoImplToJson(
      this,
    );
  }
}

abstract class _ReviewPhoto implements ReviewPhoto {
  const factory _ReviewPhoto(
      {required final String reviewPhotoId,
      required final String reviewId,
      required final String reviewPhotoUrl}) = _$ReviewPhotoImpl;

  factory _ReviewPhoto.fromJson(Map<String, dynamic> json) =
      _$ReviewPhotoImpl.fromJson;

  @override
  String get reviewPhotoId;
  @override
  String get reviewId;
  @override
  String get reviewPhotoUrl;
  @override
  @JsonKey(ignore: true)
  _$$ReviewPhotoImplCopyWith<_$ReviewPhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
