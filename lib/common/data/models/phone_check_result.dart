import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_check_result.freezed.dart';
part 'phone_check_result.g.dart';

@freezed
abstract class PhoneCheckResult with _$PhoneCheckResult {
  factory PhoneCheckResult({
    @Default(false) bool isExist,
    required int role,
    @Default(false) bool isProfileUpdated,
    @Default(0) int otpCountRequest,
  }) = _PhoneCheckResult;

  factory PhoneCheckResult.fromJson(Map<String, dynamic> json) =>
      _$PhoneCheckResultFromJson(json);
}
