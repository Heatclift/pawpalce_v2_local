import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:pawplaces/common/data/models/user_session.dart';
import 'package:pawplaces/common/data/sources/pawplace_api.dart';

class AuthenticationRepository {
  final api = PawPlaceApi.create();

///// returns session info token
  Future<String?> verifyNumber(int phoneNumer) async {
    String? installId = await FirebaseInstallations.instance.getId();

    var res = await api.verifynumber(phoneNumer, installId);
    if (res.isSuccessful) {
      var data = res.body["data"];
      if (data != null) {
        return data["sessionInfo"];
      }
    }
    return null;
  }

  Future<UserSession?> loginWithnumber(
      {required String code, required String sessionInfo}) async {
    var res =
        await api.loginWithNumber({"code": code, "sessionInfo": sessionInfo});
    if (res.isSuccessful) {
      var data = res.body["data"];
      if (data != null) {
        var session = UserSession.fromJson(data);
        return session;
      }
    }
    return null;
  }
}
