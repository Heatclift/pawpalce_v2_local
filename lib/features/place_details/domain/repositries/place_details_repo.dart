import 'package:pawplaces/common/data/sources/pawplace_api.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/place_details/data/models/place_details_model.dart';

class PlaceRepository {
  final api = PawPlaceApi.create();
  void placeDetials() {}
  Future<bool> addPlaceTofavorites(String placeId) async {
    final session = await SessionService.getSession();
    final payload = {
      "userId": session?.localId,
      "locationId": placeId,
    };
    final res = await api.addPlaceToFavorite(payload);
    if (res.isSuccessful) {
      return res.body["status"] == "success";
    } else {
      return false;
    }
  }

  Future<bool> removePlaceFromfavorites(String faveId) async {
    final res = await api.archiveFave(faveId);
    if (res.isSuccessful) {
      return res.body["status"] == "success";
    } else {
      return false;
    }
  }

  Future<PlaceDetails?> getPlaceDetails(String placeId) async {
    final res = await api.getPlaceDetails(placeId);
    if (res.isSuccessful) {
      final data = res.body["data"];
      if (data != null) {
        final details = PlaceDetails.fromJson(data);
        return details;
      }
    }
    return null;
  }
}
