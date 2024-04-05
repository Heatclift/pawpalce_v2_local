import 'package:pawplaces/common/data/sources/pawplace_api.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';

class RegisterRepository {
  final api = PawPlaceApi.create();
  Future<bool> createAccount({
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String? photo,
  }) async {
    final session = await SessionService.getSession();
    var res = await api.createAccount({
      "id": session?.localId, // required for mobile,
      "phoneNumber": phoneNumber, // without +
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password, // for merchant
      "role": 2, //2 - user, 3- merchant
      "photo": photo // base64
    });
    if (res.isSuccessful) {
      var state = res.body["status"];
      return (state == "success");
    }
    return false;
  }
}
