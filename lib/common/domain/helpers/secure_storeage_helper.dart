import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';

class SecureStorageHelper {
  Future<String?> retrieveCipherKey({String valKey = "shadow_key"}) async {
    const secureStorage = FlutterSecureStorage();
    // if key not exists return null
    final encryptionKeyString = await secureStorage.read(key: valKey);
    if (encryptionKeyString == null) {
      /// uses Hive keygen to generate a secure random cipher key
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: valKey,
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(key: valKey);

    return key;
  }
}
