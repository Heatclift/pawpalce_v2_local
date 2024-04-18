import 'package:pawplaces/common/data/sources/pawplace_api.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/place_details/data/models/review_model.dart';

class ReviewRepository {
  final api = PawPlaceApi.create();

  Future<List<Review>> getReveiwsByPlace(String palceId) async {
    final res = await api.getReviewsPerLocation(palceId);
    if (res.isSuccessful) {
      final data = res.body["data"];
      if (data != null) {
        final reviews =
            (data as List<dynamic>).map((e) => Review.fromJson(e)).toList();
        return reviews;
      }
    }
    return [];
  }

  Future<List<Review>> getReveiwsByuser(String userId) async {
    final res = await api.getReviewsPerUser(userId);
    if (res.isSuccessful) {
      final data = res.body["data"];
      if (data != null) {
        final reviews =
            (data as List<dynamic>).map((e) => Review.fromJson(e)).toList();
        return reviews;
      }
    }
    return [];
  }

  Future<bool> addReveiwToPlace({
    required String reviewDetails,
    required String locationId,
    required double rating,
    required bool isAnonymous,
    String? areasAvailable,
    required bool isNotPetFriendly,
    required List<String> reviewPhotos,
  }) async {
    final session = await SessionService.getSession();

    final payload = {
      "userId": session?.localId,
      "reviewDetails": reviewDetails,
      "locationId": locationId,
      "rating": rating,
      "areasAvailable ": areasAvailable,
      "isAnonymous": isAnonymous,
      "isNotPetFriendly": isNotPetFriendly,
      "reviewPhotos": reviewPhotos,
    };
    final res = await api.addReview(payload);
    if (res.isSuccessful) {
      return res.body["status"] == "success";
    }
    return false;
  }
}
