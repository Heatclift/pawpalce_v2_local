// ignore_for_file: invalid_annotation_target

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_session.freezed.dart';
part 'user_session.g.dart';

@HiveType(typeId: 0)
@freezed
class UserSession with _$UserSession {
  const factory UserSession({
    @HiveField(01) required String? idToken,
    @HiveField(04) required String? localId,
    @HiveField(05) required bool isNewUser,
    @HiveField(06) required String phoneNumber,
  }) = _UserSession;

  const UserSession._();

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
}
