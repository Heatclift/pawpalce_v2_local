// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationStore on _AuthenticationStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_AuthenticationStore.isLoading', context: context);

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

  late final _$isAuthenticatedAtom =
      Atom(name: '_AuthenticationStore.isAuthenticated', context: context);

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  late final _$isNewAccountAtom =
      Atom(name: '_AuthenticationStore.isNewAccount', context: context);

  @override
  bool get isNewAccount {
    _$isNewAccountAtom.reportRead();
    return super.isNewAccount;
  }

  @override
  set isNewAccount(bool value) {
    _$isNewAccountAtom.reportWrite(value, super.isNewAccount, () {
      super.isNewAccount = value;
    });
  }

  late final _$isSMSSentAtom =
      Atom(name: '_AuthenticationStore.isSMSSent', context: context);

  @override
  bool get isSMSSent {
    _$isSMSSentAtom.reportRead();
    return super.isSMSSent;
  }

  @override
  set isSMSSent(bool value) {
    _$isSMSSentAtom.reportWrite(value, super.isSMSSent, () {
      super.isSMSSent = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_AuthenticationStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: '_AuthenticationStore.errorMsg', context: context);

  @override
  String? get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String? value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  late final _$phoneNumberAtom =
      Atom(name: '_AuthenticationStore.phoneNumber', context: context);

  @override
  String? get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String? value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$verificationIdAtom =
      Atom(name: '_AuthenticationStore.verificationId', context: context);

  @override
  String? get verificationId {
    _$verificationIdAtom.reportRead();
    return super.verificationId;
  }

  @override
  set verificationId(String? value) {
    _$verificationIdAtom.reportWrite(value, super.verificationId, () {
      super.verificationId = value;
    });
  }

  late final _$futureAtom =
      Atom(name: '_AuthenticationStore.future', context: context);

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

  late final _$placesAtom =
      Atom(name: '_AuthenticationStore.places', context: context);

  @override
  ObservableList<PlaceModel> get places {
    _$placesAtom.reportRead();
    return super.places;
  }

  @override
  set places(ObservableList<PlaceModel> value) {
    _$placesAtom.reportWrite(value, super.places, () {
      super.places = value;
    });
  }

  late final _$verifyPhoneNumberAsyncAction =
      AsyncAction('_AuthenticationStore.verifyPhoneNumber', context: context);

  @override
  Future<String?> verifyPhoneNumber(String phoneNumber) {
    return _$verifyPhoneNumberAsyncAction
        .run(() => super.verifyPhoneNumber(phoneNumber));
  }

  late final _$loginWithNumberAsyncAction =
      AsyncAction('_AuthenticationStore.loginWithNumber', context: context);

  @override
  Future<UserSession?> loginWithNumber(String code) {
    return _$loginWithNumberAsyncAction.run(() => super.loginWithNumber(code));
  }

  late final _$logOutAsyncAction =
      AsyncAction('_AuthenticationStore.logOut', context: context);

  @override
  Future<void> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isAuthenticated: ${isAuthenticated},
isNewAccount: ${isNewAccount},
isSMSSent: ${isSMSSent},
error: ${error},
errorMsg: ${errorMsg},
phoneNumber: ${phoneNumber},
verificationId: ${verificationId},
future: ${future},
places: ${places}
    ''';
  }
}
