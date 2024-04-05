import 'package:hive/hive.dart';
import 'package:pawplaces/common/data/models/user_session.dart';
import 'package:pawplaces/common/domain/helpers/hive_helper.dart';

class SessionService {
  static Future<void> saveSession(UserSession session) async {
    final hive = HiveHelper();
    var box = await hive.openBox("session");
    box.put("user", session);
  }

  static Future<void> deleteSession() async {
    Hive.deleteFromDisk();
  }

  static Future<UserSession?> getSession() async {
    final hive = HiveHelper();
    var box = await hive.openBox("session");
    var user = box.get("user") as UserSession?;

    return user;
  }
}
