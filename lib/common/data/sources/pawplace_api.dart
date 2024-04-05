import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:pawplaces/common/data/sources/pawplace_api_interceptor.dart';
import 'package:pawplaces/common/domain/constants/environment.dart';

part 'pawplace_api.chopper.dart';

@ChopperApi(baseUrl: 'https://${Environment.API_HOST}${Environment.API_PATH}')
abstract class PawPlaceApi extends ChopperService {
  static PawPlaceApi create() {
    final client = ChopperClient(
        converter: const JsonConverter(),
        interceptors: [PawPlaceApiInterceptor(showLogs: kDebugMode)]);

    return _$PawPlaceApi(client);
  }

  @Get(path: '/location/nearby')
  Future<Response> getNearbyPlaces(
    @Query('lat') double lat,
    @Query('lon') double long,
  );

  @Get(path: '/profile/getprofile')
  Future<Response> getProfile(
    @Query('userId') String userId,
  );

  @Post(path: '/auth/loginnumber')
  Future<Response> loginWithNumber(@Body() Map<String, dynamic> body);

  @Put(path: '/profile/updateprofilepicture')
  Future<Response> updateProfile(@Body() Map<String, dynamic> body);

  @Post(path: '/user/createprofile')
  Future<Response> createAccount(@Body() Map<String, dynamic> body);

  @Post(path: '/auth/verifynumber', optionalBody: true)
  Future<Response> verifynumber(@Query('phoneNumber') int phoneNumberm,
      @Query('deviceId') String deviceId);
}
