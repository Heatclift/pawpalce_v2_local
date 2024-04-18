import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/domain/repositories/favorites_repo.dart';

part 'favorites_store.g.dart';

class FavoritesStore extends _FavoritesStore with _$FavoritesStore {
  FavoritesStore() : super();
}

abstract class _FavoritesStore with Store {
  final repo = FavortisRepositoriy();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<PlaceModel> favePlaces = ObservableList.of(<PlaceModel>[]);

  @observable
  BitmapDescriptor? currLocIcon;

  @action
  Future<void> loadFaves() async {
    isLoading = true;

    final faves = await repo.getAllFaves();

    favePlaces.clear();
    favePlaces.addAll(faves);

    isLoading = false;
  }
}
