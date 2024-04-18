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
    @Query('zoom') double zoom,
    @Query('radius') double radius,
  );

  @Get(path: '/profile/getprofile')
  Future<Response> getProfile(
    @Query('userId') String userId,
  );

  @Get(path: '/pet/species')
  Future<Response> getType();

  @Get(path: '/pet/breed')
  Future<Response> getBreed(
    @Query("speciesId") String? speciesId,
  );

  @Delete(path: '/user/deletepet')
  Future<Response> deletePet(
    @Query("petId") petId,
  );

  @Get(path: '/pet/details')
  Future<Response> getPetDetails(
    @Query('petId') String petId,
  );

  @Put(path: '/pet/update')
  Future<Response> updatePetDetails(@Body() Map<String, dynamic> body);

  @Get(path: '/auth/checknumber')
  Future<Response> checknumber(
    @Query('phoneNumber') int phoneNumber,
    @Query('deviceId') String installationId,
  );

  @Post(path: '/auth/loginnumber')
  Future<Response> loginWithNumber(@Body() Map<String, dynamic> body);

  @Post(path: '/pet/add')
  Future<Response> addPet(@Body() Map<String, dynamic> body);

  @Post(path: '/favorite/add')
  Future<Response> addPlaceToFavorite(@Body() Map<String, dynamic> body);

  @Get(path: '/favorite/getallfavoritesofuser')
  Future<Response> getFaves(@Query("userId") String userId);

  @Get(path: '/location/search')
  Future<Response> searchPlace(
    @Query("keyword") String keyword,
    @Query('lat') double lat,
    @Query('lon') double long,
    @Query('zoom') double zoom,
    @Query('radius') double radius,
  );

  @Get(path: '/location/details')
  Future<Response> getPlaceDetails(@Query("locationId") String locationId);

  @Post(path: '/favorite/addgroup')
  Future<Response> addFaveGroup(@Body() Map<String, dynamic> body);

  @Post(path: '/location/unlock')
  Future<Response> unlockPlace(@Body() Map<String, dynamic> body);

  @Put(path: '/favorite/updategroup')
  Future<Response> updateFaveGroup(@Body() Map<String, dynamic> body);

  @Put(path: '/favorite/archive')
  Future<Response> archiveFave(@Query("favoriteId") String favoriteId);

  @Put(path: '/profile/updateprofilepicture')
  Future<Response> updateProfile(@Body() Map<String, dynamic> body);

  @Put(path: '/profile/update')
  Future<Response> updateProfileInfo(@Body() Map<String, dynamic> body);

  @Post(path: '/user/createprofile')
  Future<Response> createAccount(@Body() Map<String, dynamic> body);

  @Post(path: '/auth/verifynumber', optionalBody: true)
  Future<Response> verifynumber(@Query('phoneNumber') int phoneNumber,
      @Query('deviceId') String deviceId);

  @Post(path: '/review/add')
  Future<Response> addReview(@Body() Map<String, dynamic> body);

  @Put(path: '/review/archive')
  Future<Response> archiveReview(@Body() Map<String, dynamic> body);

  @Get(path: '/review/details')
  Future<Response> getReviewDetails(@Query("reviewId") String reviewId);

  @Get(path: '/review/allperusert')
  Future<Response> getReviewsPerUser(@Query("userId") String userId);

  @Get(path: '/review/allperlocation')
  Future<Response> getReviewsPerLocation(
      @Query("locationId") String locationId);
}
