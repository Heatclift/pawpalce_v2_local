import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:pawplaces/common/data/models/phone_check_result.dart';
import 'package:pawplaces/common/data/sources/pawplace_api.dart';

class SessionRepository {
  final api = PawPlaceApi.create();

///// returns session info token
  Future<PhoneCheckResult?> checkNumber(int phoneNumer) async {
    String? installId = await FirebaseInstallations.instance.getId();

    var res = await api.checknumber(phoneNumer, installId);
    if (res.isSuccessful) {
      var data = res.body["data"];
      if (data != null) {
        return PhoneCheckResult.fromJson(data);
      }
    }
    return null;
  }
}
