import 'package:pawplaces/common/data/sources/pawplace_api.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/profile/data/models/user_model.dart';

class ProfileRepo {
  final api = PawPlaceApi.create();
  Future<UserModel?> getProfileDetails() async {
    var session = await SessionService.getSession();
    var result = await api.getProfile("${session?.localId}");

    if (result.isSuccessful) {
      final body = result.body;
      if (body["status"] == "success" && body["data"] != null) {
        var user = UserModel.fromJson(body["data"]);
        return user;
      }
    }
    return null;
  }
}
