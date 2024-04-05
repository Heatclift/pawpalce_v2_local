import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:pawplaces/common/data/models/user_session.dart';
import 'package:pawplaces/common/domain/helpers/secure_storeage_helper.dart';

class HiveHelper {
  final secureStorageRepo = SecureStorageHelper();

  Future<Box<T>> openBox<T>(String box) async {
    var key = await secureStorageRepo.retrieveCipherKey();
    final encryptionKeyUint8List = base64Url.decode(key!);
    final encryptedBox = await Hive.openBox<T>(box,
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));

    return encryptedBox;
  }

  /// registers type adapters for entities
  static void registerAdapters() {
    Hive.registerAdapter(UserSessionAdapter());
  }
}
