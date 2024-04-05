// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pawplace_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$PawPlaceApi extends PawPlaceApi {
  _$PawPlaceApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = PawPlaceApi;

  @override
  Future<Response<dynamic>> getNearbyPlaces(
    double lat,
    double long,
  ) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/location/nearby');
    final Map<String, dynamic> $params = <String, dynamic>{
      'lat': lat,
      'lon': long,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProfile(String userId) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/profile/getprofile');
    final Map<String, dynamic> $params = <String, dynamic>{'userId': userId};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> loginWithNumber(Map<String, dynamic> body) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/auth/loginnumber');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateProfile(Map<String, dynamic> body) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/profile/updateprofilepicture');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createAccount(Map<String, dynamic> body) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/user/createprofile');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> verifynumber(
    int phoneNumberm,
    String deviceId,
  ) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/auth/verifynumber');
    final Map<String, dynamic> $params = <String, dynamic>{
      'phoneNumber': phoneNumberm,
      'deviceId': deviceId,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
