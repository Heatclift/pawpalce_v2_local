import 'dart:io';

class MapPinAssets {
  static String currLoc = Platform.isAndroid
      ? "assets/map_pins/curLocPinSmall.png"
      : "assets/map_pins/curLocPinExSmall.png";
  static String apartment = Platform.isAndroid
      ? "assets/map_pins/Apartment.png"
      : "assets/map_pins/ApartmentSmall.png";
  static String cafe = Platform.isAndroid
      ? "assets/map_pins/Cafe.png"
      : "assets/map_pins/CafeSmall.png";
  static String grooming = Platform.isAndroid
      ? "assets/map_pins/Grooming.png"
      : "assets/map_pins/GroomingSmall.png";
  static String hotel = Platform.isAndroid
      ? "assets/map_pins/Hotels.png"
      : "assets/map_pins/HotelsSmall.png";
  static String mall = Platform.isAndroid
      ? "assets/map_pins/Malls.png"
      : "assets/map_pins/MallsSmall.png";
  static String park = Platform.isAndroid
      ? "assets/map_pins/Parks.png"
      : "assets/map_pins/ParksSmall.png";
  static String petHospital = Platform.isAndroid
      ? "assets/map_pins/PetHospital.png"
      : "assets/map_pins/PetHospitalSmall.png";
  static String petShop = Platform.isAndroid
      ? "assets/map_pins/PetShop.png"
      : "assets/map_pins/PetShopSmall.png";
  static String petHotel = Platform.isAndroid
      ? "assets/map_pins/PetHotel.png"
      : "assets/map_pins/PetHotelSmall.png";
  static String restaurant = Platform.isAndroid
      ? "assets/map_pins/Restaurant.png"
      : "assets/map_pins/RestaurantSmall.png";
}
