import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/services/location_service.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/search/domain/repositories/search_repo.dart';

part 'search_store.g.dart';

class SearchStore extends _SearchStore with _$SearchStore {
  SearchStore() : super();
}

abstract class _SearchStore with Store {
  final repo = SearchRepository();
  final _locationService = dpLocator<LocationService>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  ObservableList<PlaceModel> places = ObservableList.of(<PlaceModel>[]);

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  ReactionDisposer? errorReactDispose;

  void disposeReactions() {
    errorReactDispose?.call();
  }

  void setupReactions(BuildContext context) {
    disposeReactions();
    errorReactDispose = reaction(
      (error) => this.error,
      (error) {
        if (error != null) {
          AwesomeDialog(
            context: context,
            animType: AnimType.bottomSlide,
            headerAnimationLoop: false,
            btnOkColor: const Color(0xFFFB6021),
            dialogType: DialogType.error,
            title: error,
            btnOkOnPress: () {},
          ).show();
        }
      },
      fireImmediately: false,
    );
  }

  @action
  Future<List<PlaceModel>> search({
    required String key,
  }) async {
    isLoading = true;
    error = null;
    var location = await _locationService.getLocation();
    final res = await repo.searchKeyword(
      key,
      location.latitude,
      location.longitude,
      10,
    );
    places.clear();
    places.addAll(res);

    isLoading = false;
    return places;
  }
}
