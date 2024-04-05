import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'edit_profile_store.g.dart';

class EditProfileStore extends _EditProfileStore with _$EditProfileStore {
  EditProfileStore() : super();
}

abstract class _EditProfileStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  XFile? profilePic;

  @action
  Future<void> setPicture(XFile picture) async {
    isLoading = true;
    profilePic = picture;
    isLoading = false;
  }
}
