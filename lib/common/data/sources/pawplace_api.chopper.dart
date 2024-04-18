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
    double zoom,
    double radius,
  ) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/location/nearby');
    final Map<String, dynamic> $params = <String, dynamic>{
      'lat': lat,
      'lon': long,
      'zoom': zoom,
      'radius': radius,
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
  Future<Response<dynamic>> getType() {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/pet/species');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBreed(String? speciesId) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/pet/breed');
    final Map<String, dynamic> $params = <String, dynamic>{
      'speciesId': speciesId
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
  Future<Response<dynamic>> deletePet(dynamic petId) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/user/deletepet');
    final Map<String, dynamic> $params = <String, dynamic>{'petId': petId};
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPetDetails(String petId) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/pet/details');
    final Map<String, dynamic> $params = <String, dynamic>{'petId': petId};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePetDetails(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/pet/update');
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
  Future<Response<dynamic>> checknumber(
    int phoneNumber,
    String installationId,
  ) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/auth/checknumber');
    final Map<String, dynamic> $params = <String, dynamic>{
      'phoneNumber': phoneNumber,
      'deviceId': installationId,
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
  Future<Response<dynamic>> addPet(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/pet/add');
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
  Future<Response<dynamic>> addPlaceToFavorite(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/favorite/add');
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
  Future<Response<dynamic>> getFaves(String userId) {
    final Uri $url = Uri.parse(
        'https://api.pawplaces.app/api/favorite/getallfavoritesofuser');
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
  Future<Response<dynamic>> searchPlace(
    String keyword,
    double lat,
    double long,
    double zoom,
    double radius,
  ) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/location/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'keyword': keyword,
      'lat': lat,
      'lon': long,
      'zoom': zoom,
      'radius': radius,
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
  Future<Response<dynamic>> getPlaceDetails(String locationId) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/location/details');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locationId': locationId
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
  Future<Response<dynamic>> addFaveGroup(Map<String, dynamic> body) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/favorite/addgroup');
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
  Future<Response<dynamic>> unlockPlace(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/location/unlock');
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
  Future<Response<dynamic>> updateFaveGroup(Map<String, dynamic> body) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/favorite/updategroup');
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
  Future<Response<dynamic>> archiveFave(String favoriteId) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/favorite/archive');
    final Map<String, dynamic> $params = <String, dynamic>{
      'favoriteId': favoriteId
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
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
  Future<Response<dynamic>> updateProfileInfo(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/profile/update');
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
    int phoneNumber,
    String deviceId,
  ) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/auth/verifynumber');
    final Map<String, dynamic> $params = <String, dynamic>{
      'phoneNumber': phoneNumber,
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

  @override
  Future<Response<dynamic>> addReview(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/review/add');
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
  Future<Response<dynamic>> archiveReview(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/review/archive');
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
  Future<Response<dynamic>> getReviewDetails(String reviewId) {
    final Uri $url = Uri.parse('https://api.pawplaces.app/api/review/details');
    final Map<String, dynamic> $params = <String, dynamic>{
      'reviewId': reviewId
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
  Future<Response<dynamic>> getReviewsPerUser(String userId) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/review/allperusert');
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
  Future<Response<dynamic>> getReviewsPerLocation(String locationId) {
    final Uri $url =
        Uri.parse('https://api.pawplaces.app/api/review/allperlocation');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locationId': locationId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
