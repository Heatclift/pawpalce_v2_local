// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessionStore on _SessionStore, Store {
  Computed<bool>? _$hasSessionComputed;

  @override
  bool get hasSession =>
      (_$hasSessionComputed ??= Computed<bool>(() => super.hasSession,
              name: '_SessionStore.hasSession'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_SessionStore.isLoading', context: context);

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
      Atom(name: '_SessionStore.future', context: context);

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

  late final _$sessionAtom =
      Atom(name: '_SessionStore.session', context: context);

  @override
  UserSession? get session {
    _$sessionAtom.reportRead();
    return super.session;
  }

  @override
  set session(UserSession? value) {
    _$sessionAtom.reportWrite(value, super.session, () {
      super.session = value;
    });
  }

  late final _$initSessionAsyncAction =
      AsyncAction('_SessionStore.initSession', context: context);

  @override
  Future<void> initSession() {
    return _$initSessionAsyncAction.run(() => super.initSession());
  }

  late final _$logOutAsyncAction =
      AsyncAction('_SessionStore.logOut', context: context);

  @override
  Future<void> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
future: ${future},
session: ${session},
hasSession: ${hasSession}
    ''';
  }
}
