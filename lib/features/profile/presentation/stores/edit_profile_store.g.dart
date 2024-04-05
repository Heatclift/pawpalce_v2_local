// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditProfileStore on _EditProfileStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EditProfileStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$futureAtom =
      Atom(name: '_EditProfileStore.future', context: context);

  @override
  ObservableFuture<dynamic> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(ObservableFuture<dynamic> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$profilePicAtom =
      Atom(name: '_EditProfileStore.profilePic', context: context);

  @override
  XFile? get profilePic {
    _$profilePicAtom.reportRead();
    return super.profilePic;
  }

  @override
  set profilePic(XFile? value) {
    _$profilePicAtom.reportWrite(value, super.profilePic, () {
      super.profilePic = value;
    });
  }

  late final _$setPictureAsyncAction =
      AsyncAction('_EditProfileStore.setPicture', context: context);

  @override
  Future<void> setPicture(XFile picture) {
    return _$setPictureAsyncAction.run(() => super.setPicture(picture));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
future: ${future},
profilePic: ${profilePic}
    ''';
  }
}
