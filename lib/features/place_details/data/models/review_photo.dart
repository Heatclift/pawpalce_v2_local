import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_photo.freezed.dart';
part 'review_photo.g.dart';

@freezed
abstract class ReviewPhoto with _$ReviewPhoto {
  const factory ReviewPhoto({
    required String reviewPhotoId,
    required String reviewId,
    required String reviewPhotoUrl,
  }) = _ReviewPhoto;

  factory ReviewPhoto.fromJson(Map<String, dynamic> json) =>
      _$ReviewPhotoFromJson(json);
}
