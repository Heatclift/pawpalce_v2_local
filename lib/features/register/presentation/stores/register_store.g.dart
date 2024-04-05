// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationStore on _RegistrationStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_RegistrationStore.isLoading', context: context);

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

  late final _$isRegisteredAtom =
      Atom(name: '_RegistrationStore.isRegistered', context: context);

  @override
  bool get isRegistered {
    _$isRegisteredAtom.reportRead();
    return super.isRegistered;
  }

  @override
  set isRegistered(bool value) {
    _$isRegisteredAtom.reportWrite(value, super.isRegistered, () {
      super.isRegistered = value;
    });
  }

  late final _$isTermsAgreedAtom =
      Atom(name: '_RegistrationStore.isTermsAgreed', context: context);

  @override
  bool get isTermsAgreed {
    _$isTermsAgreedAtom.reportRead();
    return super.isTermsAgreed;
  }

  @override
  set isTermsAgreed(bool value) {
    _$isTermsAgreedAtom.reportWrite(value, super.isTermsAgreed, () {
      super.isTermsAgreed = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_RegistrationStore.error', context: context);

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

  late final _$phoneNumberAtom =
      Atom(name: '_RegistrationStore.phoneNumber', context: context);

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

  late final _$futureAtom =
      Atom(name: '_RegistrationStore.future', context: context);

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

  late final _$registerAsyncAction =
      AsyncAction('_RegistrationStore.register', context: context);

  @override
  Future<bool> register(
      {required String phoneNumber,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String? photo}) {
    return _$registerAsyncAction.run(() => super.register(
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        photo: photo));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isRegistered: ${isRegistered},
isTermsAgreed: ${isTermsAgreed},
error: ${error},
phoneNumber: ${phoneNumber},
future: ${future}
    ''';
  }
}
