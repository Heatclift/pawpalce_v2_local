import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/features/profile/domain/repositories/profile_repo.dart';
import 'package:pawplaces/main.dart';

part 'edit_profile_store.g.dart';

class EditProfileStore extends _EditProfileStore with _$EditProfileStore {
  EditProfileStore() : super();
}

abstract class _EditProfileStore with Store {
  final repo = ProfileRepo();
  @observable
  bool isLoading = false;

  @observable
  bool isUpdateSuccess = false;

  @observable
  String? error;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  XFile? profilePic;

  ReactionDisposer? errorReactDispose;
  ReactionDisposer? updateSuccessDispose;

  void disposeReactions() {
    errorReactDispose?.call();
  }

  void setupReactions(BuildContext context) {
    isUpdateSuccess = false;
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

    updateSuccessDispose = when((p0) => isUpdateSuccess, () {
      AwesomeDialog(
        context: context,
        animType: AnimType.bottomSlide,
        headerAnimationLoop: false,
        btnOkColor: const Color(0xFFFB6021),
        dialogType: DialogType.success,
        title: "Your profile has been updated!",
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          router.pop();
        },
      ).show();
    });
  }

  @action
  Future<void> setPicture(XFile picture) async {
    error = null;
    isLoading = true;

    final imageBytes = await picture.readAsBytes();
    final imageEncoded = base64Encode(imageBytes);
    final fileType = picture.path.split(".").last;
    final mimed = "data:image/$fileType;base64,$imageEncoded";
    final res = await repo.updateProfilePic(mimed);

    if (res) {
      error = null;
      profilePic = picture;
    } else {
      error = "Failed to update your profile picture.";
    }

    isLoading = false;
  }

  @action
  Future<void> updateProfile({
    String? email,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
  }) async {
    error = null;
    isLoading = true;

    final res = await repo.updateProfileInfo(
      email: email,
      dateOfBirth: dateOfBirth,
      firstName: firstName,
      lastName: lastName,
    );

    if (res) {
      error = null;
    } else {
      error = "Failed to update your profile info.";
    }

    isUpdateSuccess = res;

    isLoading = false;
  }
}
