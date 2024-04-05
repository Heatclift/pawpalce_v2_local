// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_check_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneCheckResultImpl _$$PhoneCheckResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PhoneCheckResultImpl(
      isExist: json['isExist'] as bool? ?? false,
      role: json['role'] as int,
      isProfileUpdated: json['isProfileUpdated'] as bool? ?? false,
      otpCountRequest: json['otpCountRequest'] as int? ?? 0,
    );

Map<String, dynamic> _$$PhoneCheckResultImplToJson(
        _$PhoneCheckResultImpl instance) =>
    <String, dynamic>{
      'isExist': instance.isExist,
      'role': instance.role,
      'isProfileUpdated': instance.isProfileUpdated,
      'otpCountRequest': instance.otpCountRequest,
    };
