import 'package:pawplaces/common/data/sources/pawplace_api.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';

class FavortisRepositoriy {
  final api = PawPlaceApi.create();
  Future<List<PlaceModel>> getAllFaves() async {
    final session = await SessionService.getSession();
    final res = await api.getFaves(session!.localId!);
    if (res.isSuccessful) {
      final data = res.body["data"]["favorites"];
      if (data != null) {
        final places = (data as List<Map<String, dynamic>>)
            .map((e) => PlaceModel.fromJson(e))
            .toList();
        return places;
      }
    }
    return [];
  }
}
