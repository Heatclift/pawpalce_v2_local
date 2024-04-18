import 'package:mobx/mobx.dart';
import 'package:pawplaces/features/profile/data/models/user_model.dart';
import 'package:pawplaces/features/profile/domain/repositories/profile_repo.dart';

part 'profile_store.g.dart';

class ProfileStore extends _ProfileStore with _$ProfileStore {
  ProfileStore() : super();
}

abstract class _ProfileStore with Store {
  final repo = ProfileRepo();

  @observable
  bool isLoading = false;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  UserModel? user;

  @computed
  bool get hasUser => user != null;

  @computed
  bool get hasPet => user?.petProfiles?.isNotEmpty ?? false;

  @action
  Future<UserModel?> getProfileDetails() async {
    isLoading = true;
    future = ObservableFuture<UserModel?>(repo.getProfileDetails());
    user = await future;
    isLoading = false;
    return user;
  }
}
