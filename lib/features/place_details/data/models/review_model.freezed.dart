// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String get reviewId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get reviewDetails => throw _privateConstructorUsedError;
  @JsonKey(name: "locationDetails")
  PlaceModel? get place => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  bool get isAnonymous => throw _privateConstructorUsedError;
  bool get isNotPetFriendly => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  List<String>? get areasAvailable => throw _privateConstructorUsedError;
  List<ReviewPhoto> get reviewPhotos => throw _privateConstructorUsedError;
  String get reviewerName => throw _privateConstructorUsedError;
  String? get reviewerPhotoUrl => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String reviewId,
      String userId,
      String reviewDetails,
      @JsonKey(name: "locationDetails") PlaceModel? place,
      DateTime createdAt,
      String createdBy,
      DateTime updatedAt,
      String updatedBy,
      String locationId,
      bool isArchived,
      bool isAnonymous,
      bool isNotPetFriendly,
      double rating,
      List<String>? areasAvailable,
      List<ReviewPhoto> reviewPhotos,
      String reviewerName,
      String? reviewerPhotoUrl,
      String email});

  $PlaceModelCopyWith<$Res>? get place;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? userId = null,
    Object? reviewDetails = null,
    Object? place = freezed,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? updatedBy = null,
    Object? locationId = null,
    Object? isArchived = null,
    Object? isAnonymous = null,
    Object? isNotPetFriendly = null,
    Object? rating = null,
    Object? areasAvailable = freezed,
    Object? reviewPhotos = null,
    Object? reviewerName = null,
    Object? reviewerPhotoUrl = freezed,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewDetails: null == reviewDetails
          ? _value.reviewDetails
          : reviewDetails // ignore: cast_nullable_to_non_nullable
              as String,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotPetFriendly: null == isNotPetFriendly
          ? _value.isNotPetFriendly
          : isNotPetFriendly // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      areasAvailable: freezed == areasAvailable
          ? _value.areasAvailable
          : areasAvailable // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviewPhotos: null == reviewPhotos
          ? _value.reviewPhotos
          : reviewPhotos // ignore: cast_nullable_to_non_nullable
              as List<ReviewPhoto>,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerPhotoUrl: freezed == reviewerPhotoUrl
          ? _value.reviewerPhotoUrl
          : reviewerPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceModelCopyWith<$Res>? get place {
    if (_value.place == null) {
      return null;
    }

    return $PlaceModelCopyWith<$Res>(_value.place!, (value) {
      return _then(_value.copyWith(place: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reviewId,
      String userId,
      String reviewDetails,
      @JsonKey(name: "locationDetails") PlaceModel? place,
      DateTime createdAt,
      String createdBy,
      DateTime updatedAt,
      String updatedBy,
      String locationId,
      bool isArchived,
      bool isAnonymous,
      bool isNotPetFriendly,
      double rating,
      List<String>? areasAvailable,
      List<ReviewPhoto> reviewPhotos,
      String reviewerName,
      String? reviewerPhotoUrl,
      String email});

  @override
  $PlaceModelCopyWith<$Res>? get place;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? userId = null,
    Object? reviewDetails = null,
    Object? place = freezed,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? updatedBy = null,
    Object? locationId = null,
    Object? isArchived = null,
    Object? isAnonymous = null,
    Object? isNotPetFriendly = null,
    Object? rating = null,
    Object? areasAvailable = freezed,
    Object? reviewPhotos = null,
    Object? reviewerName = null,
    Object? reviewerPhotoUrl = freezed,
    Object? email = null,
  }) {
    return _then(_$ReviewImpl(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewDetails: null == reviewDetails
          ? _value.reviewDetails
          : reviewDetails // ignore: cast_nullable_to_non_nullable
              as String,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotPetFriendly: null == isNotPetFriendly
          ? _value.isNotPetFriendly
          : isNotPetFriendly // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      areasAvailable: freezed == areasAvailable
          ? _value._areasAvailable
          : areasAvailable // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviewPhotos: null == reviewPhotos
          ? _value._reviewPhotos
          : reviewPhotos // ignore: cast_nullable_to_non_nullable
              as List<ReviewPhoto>,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerPhotoUrl: freezed == reviewerPhotoUrl
          ? _value.reviewerPhotoUrl
          : reviewerPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  _$ReviewImpl(
      {required this.reviewId,
      required this.userId,
      required this.reviewDetails,
      @JsonKey(name: "locationDetails") this.place,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.updatedBy,
      required this.locationId,
      this.isArchived = false,
      this.isAnonymous = false,
      this.isNotPetFriendly = false,
      required this.rating,
      final List<String>? areasAvailable,
      required final List<ReviewPhoto> reviewPhotos,
      required this.reviewerName,
      this.reviewerPhotoUrl,
      required this.email})
      : _areasAvailable = areasAvailable,
        _reviewPhotos = reviewPhotos;

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final String reviewId;
  @override
  final String userId;
  @override
  final String reviewDetails;
  @override
  @JsonKey(name: "locationDetails")
  final PlaceModel? place;
  @override
  final DateTime createdAt;
  @override
  final String createdBy;
  @override
  final DateTime updatedAt;
  @override
  final String updatedBy;
  @override
  final String locationId;
  @override
  @JsonKey()
  final bool isArchived;
  @override
  @JsonKey()
  final bool isAnonymous;
  @override
  @JsonKey()
  final bool isNotPetFriendly;
  @override
  final double rating;
  final List<String>? _areasAvailable;
  @override
  List<String>? get areasAvailable {
    final value = _areasAvailable;
    if (value == null) return null;
    if (_areasAvailable is EqualUnmodifiableListView) return _areasAvailable;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReviewPhoto> _reviewPhotos;
  @override
  List<ReviewPhoto> get reviewPhotos {
    if (_reviewPhotos is EqualUnmodifiableListView) return _reviewPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewPhotos);
  }

  @override
  final String reviewerName;
  @override
  final String? reviewerPhotoUrl;
  @override
  final String email;

  @override
  String toString() {
    return 'Review(reviewId: $reviewId, userId: $userId, reviewDetails: $reviewDetails, place: $place, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy, locationId: $locationId, isArchived: $isArchived, isAnonymous: $isAnonymous, isNotPetFriendly: $isNotPetFriendly, rating: $rating, areasAvailable: $areasAvailable, reviewPhotos: $reviewPhotos, reviewerName: $reviewerName, reviewerPhotoUrl: $reviewerPhotoUrl, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.reviewDetails, reviewDetails) ||
                other.reviewDetails == reviewDetails) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.isNotPetFriendly, isNotPetFriendly) ||
                other.isNotPetFriendly == isNotPetFriendly) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._areasAvailable, _areasAvailable) &&
            const DeepCollectionEquality()
                .equals(other._reviewPhotos, _reviewPhotos) &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName) &&
            (identical(other.reviewerPhotoUrl, reviewerPhotoUrl) ||
                other.reviewerPhotoUrl == reviewerPhotoUrl) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewId,
      userId,
      reviewDetails,
      place,
      createdAt,
      createdBy,
      updatedAt,
      updatedBy,
      locationId,
      isArchived,
      isAnonymous,
      isNotPetFriendly,
      rating,
      const DeepCollectionEquality().hash(_areasAvailable),
      const DeepCollectionEquality().hash(_reviewPhotos),
      reviewerName,
      reviewerPhotoUrl,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  factory _Review(
      {required final String reviewId,
      required final String userId,
      required final String reviewDetails,
      @JsonKey(name: "locationDetails") final PlaceModel? place,
      required final DateTime createdAt,
      required final String createdBy,
      required final DateTime updatedAt,
      required final String updatedBy,
      required final String locationId,
      final bool isArchived,
      final bool isAnonymous,
      final bool isNotPetFriendly,
      required final double rating,
      final List<String>? areasAvailable,
      required final List<ReviewPhoto> reviewPhotos,
      required final String reviewerName,
      final String? reviewerPhotoUrl,
      required final String email}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String get reviewId;
  @override
  String get userId;
  @override
  String get reviewDetails;
  @override
  @JsonKey(name: "locationDetails")
  PlaceModel? get place;
  @override
  DateTime get createdAt;
  @override
  String get createdBy;
  @override
  DateTime get updatedAt;
  @override
  String get updatedBy;
  @override
  String get locationId;
  @override
  bool get isArchived;
  @override
  bool get isAnonymous;
  @override
  bool get isNotPetFriendly;
  @override
  double get rating;
  @override
  List<String>? get areasAvailable;
  @override
  List<ReviewPhoto> get reviewPhotos;
  @override
  String get reviewerName;
  @override
  String? get reviewerPhotoUrl;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
