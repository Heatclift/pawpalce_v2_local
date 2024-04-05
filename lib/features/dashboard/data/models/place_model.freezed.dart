// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) {
  return _PlaceModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceModel {
  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: "locationName")
  String get placeName => throw _privateConstructorUsedError;
  @JsonKey(name: "googlePhotoUrl")
  String get thumbnail => throw _privateConstructorUsedError;
  String? get placeDescription => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: "googleRating")
  double get placeRating => throw _privateConstructorUsedError;
  @JsonKey(name: "googleRatingCount")
  int get placeRatingCount => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceModelCopyWith<PlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceModelCopyWith<$Res> {
  factory $PlaceModelCopyWith(
          PlaceModel value, $Res Function(PlaceModel) then) =
      _$PlaceModelCopyWithImpl<$Res, PlaceModel>;
  @useResult
  $Res call(
      {String placeId,
      @JsonKey(name: "locationName") String placeName,
      @JsonKey(name: "googlePhotoUrl") String thumbnail,
      String? placeDescription,
      String category,
      @JsonKey(name: "googleRating") double placeRating,
      @JsonKey(name: "googleRatingCount") int placeRatingCount,
      double latitude,
      double longitude});
}

/// @nodoc
class _$PlaceModelCopyWithImpl<$Res, $Val extends PlaceModel>
    implements $PlaceModelCopyWith<$Res> {
  _$PlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? placeName = null,
    Object? thumbnail = null,
    Object? placeDescription = freezed,
    Object? category = null,
    Object? placeRating = null,
    Object? placeRatingCount = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      placeDescription: freezed == placeDescription
          ? _value.placeDescription
          : placeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      placeRating: null == placeRating
          ? _value.placeRating
          : placeRating // ignore: cast_nullable_to_non_nullable
              as double,
      placeRatingCount: null == placeRatingCount
          ? _value.placeRatingCount
          : placeRatingCount // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceModelImplCopyWith<$Res>
    implements $PlaceModelCopyWith<$Res> {
  factory _$$PlaceModelImplCopyWith(
          _$PlaceModelImpl value, $Res Function(_$PlaceModelImpl) then) =
      __$$PlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String placeId,
      @JsonKey(name: "locationName") String placeName,
      @JsonKey(name: "googlePhotoUrl") String thumbnail,
      String? placeDescription,
      String category,
      @JsonKey(name: "googleRating") double placeRating,
      @JsonKey(name: "googleRatingCount") int placeRatingCount,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$PlaceModelImplCopyWithImpl<$Res>
    extends _$PlaceModelCopyWithImpl<$Res, _$PlaceModelImpl>
    implements _$$PlaceModelImplCopyWith<$Res> {
  __$$PlaceModelImplCopyWithImpl(
      _$PlaceModelImpl _value, $Res Function(_$PlaceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? placeName = null,
    Object? thumbnail = null,
    Object? placeDescription = freezed,
    Object? category = null,
    Object? placeRating = null,
    Object? placeRatingCount = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$PlaceModelImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      placeDescription: freezed == placeDescription
          ? _value.placeDescription
          : placeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      placeRating: null == placeRating
          ? _value.placeRating
          : placeRating // ignore: cast_nullable_to_non_nullable
              as double,
      placeRatingCount: null == placeRatingCount
          ? _value.placeRatingCount
          : placeRatingCount // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceModelImpl implements _PlaceModel {
  const _$PlaceModelImpl(
      {required this.placeId,
      @JsonKey(name: "locationName") required this.placeName,
      @JsonKey(name: "googlePhotoUrl")
      this.thumbnail = "https://loremflickr.com/128/101",
      this.placeDescription,
      this.category = "pethotel",
      @JsonKey(name: "googleRating") this.placeRating = 0.0,
      @JsonKey(name: "googleRatingCount") this.placeRatingCount = 0,
      required this.latitude,
      required this.longitude});

  factory _$PlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceModelImplFromJson(json);

  @override
  final String placeId;
  @override
  @JsonKey(name: "locationName")
  final String placeName;
  @override
  @JsonKey(name: "googlePhotoUrl")
  final String thumbnail;
  @override
  final String? placeDescription;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey(name: "googleRating")
  final double placeRating;
  @override
  @JsonKey(name: "googleRatingCount")
  final int placeRatingCount;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'PlaceModel(placeId: $placeId, placeName: $placeName, thumbnail: $thumbnail, placeDescription: $placeDescription, category: $category, placeRating: $placeRating, placeRatingCount: $placeRatingCount, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceModelImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.placeDescription, placeDescription) ||
                other.placeDescription == placeDescription) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.placeRating, placeRating) ||
                other.placeRating == placeRating) &&
            (identical(other.placeRatingCount, placeRatingCount) ||
                other.placeRatingCount == placeRatingCount) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      placeName,
      thumbnail,
      placeDescription,
      category,
      placeRating,
      placeRatingCount,
      latitude,
      longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      __$$PlaceModelImplCopyWithImpl<_$PlaceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceModel implements PlaceModel {
  const factory _PlaceModel(
      {required final String placeId,
      @JsonKey(name: "locationName") required final String placeName,
      @JsonKey(name: "googlePhotoUrl") final String thumbnail,
      final String? placeDescription,
      final String category,
      @JsonKey(name: "googleRating") final double placeRating,
      @JsonKey(name: "googleRatingCount") final int placeRatingCount,
      required final double latitude,
      required final double longitude}) = _$PlaceModelImpl;

  factory _PlaceModel.fromJson(Map<String, dynamic> json) =
      _$PlaceModelImpl.fromJson;

  @override
  String get placeId;
  @override
  @JsonKey(name: "locationName")
  String get placeName;
  @override
  @JsonKey(name: "googlePhotoUrl")
  String get thumbnail;
  @override
  String? get placeDescription;
  @override
  String get category;
  @override
  @JsonKey(name: "googleRating")
  double get placeRating;
  @override
  @JsonKey(name: "googleRatingCount")
  int get placeRatingCount;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
