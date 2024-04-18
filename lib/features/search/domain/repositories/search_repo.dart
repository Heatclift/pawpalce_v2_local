import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:pawplaces/common/data/sources/pawplace_api.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';

class SearchRepository {
  final api = PawPlaceApi.create();

  Future<List<PlaceModel>> searchKeyword(
      String key, double lat, double long, double zoom) async {
    final distanceInterval =
        FirebaseRemoteConfig.instance.getDouble("distanceInterval") * 1000;
    final res = await api.searchPlace(key, lat, long, zoom, distanceInterval);
    if (res.isSuccessful) {
      final data = res.body["data"];
      if (data != null) {
        final places =
            (data as List<dynamic>).map((e) => PlaceModel.fromJson(e)).toList();
        return places;
      }
    }
    return [];
  }
}
