// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceDetails _$PlaceDetailsFromJson(Map<String, dynamic> json) {
  return _PlaceDetails.fromJson(json);
}

/// @nodoc
mixin _$PlaceDetails {
  String get locationId => throw _privateConstructorUsedError;
  int get indoorVotes => throw _privateConstructorUsedError;
  int get outdoorVotes => throw _privateConstructorUsedError;
  int get bothVotes => throw _privateConstructorUsedError;
  String get formattedAddress => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get googleMapsURL => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  String get locationNameLanguage => throw _privateConstructorUsedError;
  String? get googlePhotoUrl => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  bool get isPetFriendly => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get openNow => throw _privateConstructorUsedError;
  List<Map<String, String>> get openingHours =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceDetailsCopyWith<PlaceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailsCopyWith<$Res> {
  factory $PlaceDetailsCopyWith(
          PlaceDetails value, $Res Function(PlaceDetails) then) =
      _$PlaceDetailsCopyWithImpl<$Res, PlaceDetails>;
  @useResult
  $Res call(
      {String locationId,
      int indoorVotes,
      int outdoorVotes,
      int bothVotes,
      String formattedAddress,
      double latitude,
      double longitude,
      String googleMapsURL,
      String locationName,
      String locationNameLanguage,
      String? googlePhotoUrl,
      double distance,
      bool isPetFriendly,
      bool isFavorite,
      String category,
      bool openNow,
      List<Map<String, String>> openingHours});
}

/// @nodoc
class _$PlaceDetailsCopyWithImpl<$Res, $Val extends PlaceDetails>
    implements $PlaceDetailsCopyWith<$Res> {
  _$PlaceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = null,
    Object? indoorVotes = null,
    Object? outdoorVotes = null,
    Object? bothVotes = null,
    Object? formattedAddress = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? googleMapsURL = null,
    Object? locationName = null,
    Object? locationNameLanguage = null,
    Object? googlePhotoUrl = freezed,
    Object? distance = null,
    Object? isPetFriendly = null,
    Object? isFavorite = null,
    Object? category = null,
    Object? openNow = null,
    Object? openingHours = null,
  }) {
    return _then(_value.copyWith(
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      indoorVotes: null == indoorVotes
          ? _value.indoorVotes
          : indoorVotes // ignore: cast_nullable_to_non_nullable
              as int,
      outdoorVotes: null == outdoorVotes
          ? _value.outdoorVotes
          : outdoorVotes // ignore: cast_nullable_to_non_nullable
              as int,
      bothVotes: null == bothVotes
          ? _value.bothVotes
          : bothVotes // ignore: cast_nullable_to_non_nullable
              as int,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      googleMapsURL: null == googleMapsURL
          ? _value.googleMapsURL
          : googleMapsURL // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      locationNameLanguage: null == locationNameLanguage
          ? _value.locationNameLanguage
          : locationNameLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      googlePhotoUrl: freezed == googlePhotoUrl
          ? _value.googlePhotoUrl
          : googlePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      isPetFriendly: null == isPetFriendly
          ? _value.isPetFriendly
          : isPetFriendly // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      openingHours: null == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceDetailsImplCopyWith<$Res>
    implements $PlaceDetailsCopyWith<$Res> {
  factory _$$PlaceDetailsImplCopyWith(
          _$PlaceDetailsImpl value, $Res Function(_$PlaceDetailsImpl) then) =
      __$$PlaceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String locationId,
      int indoorVotes,
      int outdoorVotes,
      int bothVotes,
      String formattedAddress,
      double latitude,
      double longitude,
      String googleMapsURL,
      String locationName,
      String locationNameLanguage,
      String? googlePhotoUrl,
      double distance,
      bool isPetFriendly,
      bool isFavorite,
      String category,
      bool openNow,
      List<Map<String, String>> openingHours});
}

/// @nodoc
class __$$PlaceDetailsImplCopyWithImpl<$Res>
    extends _$PlaceDetailsCopyWithImpl<$Res, _$PlaceDetailsImpl>
    implements _$$PlaceDetailsImplCopyWith<$Res> {
  __$$PlaceDetailsImplCopyWithImpl(
      _$PlaceDetailsImpl _value, $Res Function(_$PlaceDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = null,
    Object? indoorVotes = null,
    Object? outdoorVotes = null,
    Object? bothVotes = null,
    Object? formattedAddress = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? googleMapsURL = null,
    Object? locationName = null,
    Object? locationNameLanguage = null,
    Object? googlePhotoUrl = freezed,
    Object? distance = null,
    Object? isPetFriendly = null,
    Object? isFavorite = null,
    Object? category = null,
    Object? openNow = null,
    Object? openingHours = null,
  }) {
    return _then(_$PlaceDetailsImpl(
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      indoorVotes: null == indoorVotes
          ? _value.indoorVotes
          : indoorVotes // ignore: cast_nullable_to_non_nullable
              as int,
      outdoorVotes: null == outdoorVotes
          ? _value.outdoorVotes
          : outdoorVotes // ignore: cast_nullable_to_non_nullable
              as int,
      bothVotes: null == bothVotes
          ? _value.bothVotes
          : bothVotes // ignore: cast_nullable_to_non_nullable
              as int,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      googleMapsURL: null == googleMapsURL
          ? _value.googleMapsURL
          : googleMapsURL // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      locationNameLanguage: null == locationNameLanguage
          ? _value.locationNameLanguage
          : locationNameLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      googlePhotoUrl: freezed == googlePhotoUrl
          ? _value.googlePhotoUrl
          : googlePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      isPetFriendly: null == isPetFriendly
          ? _value.isPetFriendly
          : isPetFriendly // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      openingHours: null == openingHours
          ? _value._openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceDetailsImpl implements _PlaceDetails {
  const _$PlaceDetailsImpl(
      {required this.locationId,
      required this.indoorVotes,
      required this.outdoorVotes,
      required this.bothVotes,
      required this.formattedAddress,
      required this.latitude,
      required this.longitude,
      required this.googleMapsURL,
      required this.locationName,
      required this.locationNameLanguage,
      this.googlePhotoUrl,
      required this.distance,
      required this.isPetFriendly,
      required this.isFavorite,
      required this.category,
      required this.openNow,
      required final List<Map<String, String>> openingHours})
      : _openingHours = openingHours;

  factory _$PlaceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceDetailsImplFromJson(json);

  @override
  final String locationId;
  @override
  final int indoorVotes;
  @override
  final int outdoorVotes;
  @override
  final int bothVotes;
  @override
  final String formattedAddress;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String googleMapsURL;
  @override
  final String locationName;
  @override
  final String locationNameLanguage;
  @override
  final String? googlePhotoUrl;
  @override
  final double distance;
  @override
  final bool isPetFriendly;
  @override
  final bool isFavorite;
  @override
  final String category;
  @override
  final bool openNow;
  final List<Map<String, String>> _openingHours;
  @override
  List<Map<String, String>> get openingHours {
    if (_openingHours is EqualUnmodifiableListView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openingHours);
  }

  @override
  String toString() {
    return 'PlaceDetails(locationId: $locationId, indoorVotes: $indoorVotes, outdoorVotes: $outdoorVotes, bothVotes: $bothVotes, formattedAddress: $formattedAddress, latitude: $latitude, longitude: $longitude, googleMapsURL: $googleMapsURL, locationName: $locationName, locationNameLanguage: $locationNameLanguage, googlePhotoUrl: $googlePhotoUrl, distance: $distance, isPetFriendly: $isPetFriendly, isFavorite: $isFavorite, category: $category, openNow: $openNow, openingHours: $openingHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsImpl &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.indoorVotes, indoorVotes) ||
                other.indoorVotes == indoorVotes) &&
            (identical(other.outdoorVotes, outdoorVotes) ||
                other.outdoorVotes == outdoorVotes) &&
            (identical(other.bothVotes, bothVotes) ||
                other.bothVotes == bothVotes) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.googleMapsURL, googleMapsURL) ||
                other.googleMapsURL == googleMapsURL) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.locationNameLanguage, locationNameLanguage) ||
                other.locationNameLanguage == locationNameLanguage) &&
            (identical(other.googlePhotoUrl, googlePhotoUrl) ||
                other.googlePhotoUrl == googlePhotoUrl) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.isPetFriendly, isPetFriendly) ||
                other.isPetFriendly == isPetFriendly) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.openNow, openNow) || other.openNow == openNow) &&
            const DeepCollectionEquality()
                .equals(other._openingHours, _openingHours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      locationId,
      indoorVotes,
      outdoorVotes,
      bothVotes,
      formattedAddress,
      latitude,
      longitude,
      googleMapsURL,
      locationName,
      locationNameLanguage,
      googlePhotoUrl,
      distance,
      isPetFriendly,
      isFavorite,
      category,
      openNow,
      const DeepCollectionEquality().hash(_openingHours));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailsImplCopyWith<_$PlaceDetailsImpl> get copyWith =>
      __$$PlaceDetailsImplCopyWithImpl<_$PlaceDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceDetailsImplToJson(
      this,
    );
  }
}

abstract class _PlaceDetails implements PlaceDetails {
  const factory _PlaceDetails(
          {required final String locationId,
          required final int indoorVotes,
          required final int outdoorVotes,
          required final int bothVotes,
          required final String formattedAddress,
          required final double latitude,
          required final double longitude,
          required final String googleMapsURL,
          required final String locationName,
          required final String locationNameLanguage,
          final String? googlePhotoUrl,
          required final double distance,
          required final bool isPetFriendly,
          required final bool isFavorite,
          required final String category,
          required final bool openNow,
          required final List<Map<String, String>> openingHours}) =
      _$PlaceDetailsImpl;

  factory _PlaceDetails.fromJson(Map<String, dynamic> json) =
      _$PlaceDetailsImpl.fromJson;

  @override
  String get locationId;
  @override
  int get indoorVotes;
  @override
  int get outdoorVotes;
  @override
  int get bothVotes;
  @override
  String get formattedAddress;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get googleMapsURL;
  @override
  String get locationName;
  @override
  String get locationNameLanguage;
  @override
  String? get googlePhotoUrl;
  @override
  double get distance;
  @override
  bool get isPetFriendly;
  @override
  bool get isFavorite;
  @override
  String get category;
  @override
  bool get openNow;
  @override
  List<Map<String, String>> get openingHours;
  @override
  @JsonKey(ignore: true)
  _$$PlaceDetailsImplCopyWith<_$PlaceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
