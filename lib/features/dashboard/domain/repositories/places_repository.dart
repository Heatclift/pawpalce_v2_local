import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/common/data/sources/pawplace_api.dart';

class PlacesRepository {
  final api = PawPlaceApi.create();

  Future<bool> unlockPlace(String placeId) async {
    final session = await SessionService.getSession();
    final payload = {
      "locationId": placeId,
      "userId": session!.localId!,
    };
    final res = await api.unlockPlace(payload);
    if (res.isSuccessful) {
      return res.body["status"] == "success";
    } else {
      return false;
    }
  }

  Future<List<PlaceModel>> getPlaces(
      {required double lat, required double long, required double zoom}) async {
    var places = [
      const PlaceModel(
        placeId: "1",
        placeName: "Paw Inn",
        placeDescription:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        category: "pethotel",
        latitude: 14.628409,
        longitude: 121.006586,
      ),
      const PlaceModel(
        placeId: "2",
        placeName: "Tea House Parks",
        placeDescription:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        category: "park",
        latitude: 14.650345826052968,
        longitude: 121.04276963785682,
      ),
      const PlaceModel(
        placeId: "3",
        placeName: "Ninoy Aquino Park",
        placeDescription:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        category: "pethotel",
        latitude: 14.65219854096807,
        longitude: 121.04530245457529,
      ),
      const PlaceModel(
        placeId: "4",
        placeName: "Furry Tails",
        placeDescription:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        category: "petshop",
        latitude: 14.658845872739438,
        longitude: 121.02993853092792,
      ),
      const PlaceModel(
        placeId: "5",
        placeName: "The Dog Spa & Hotel Examiner St",
        placeDescription:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        category: "pethotel",
        latitude: 14.643875071019645,
        longitude: 121.03113860960805,
      ),
    ];

    final distanceInterval =
        FirebaseRemoteConfig.instance.getDouble("distanceInterval") * 1000;

    final res = await api.getNearbyPlaces(lat, long, zoom, distanceInterval);

    if (res.isSuccessful && res.body != null) {
      if (res.body["status"] == "success") {
        var data = res.body["data"] as List;
        try {
          var locs = data.map((e) => PlaceModel.fromJson(e)).toList();
          places = locs;
        } catch (e) {
          FirebaseCrashlytics.instance.recordError(
            e,
            null,
            fatal: false,
          );
        }
      }
    }

    return places;
  }
}
