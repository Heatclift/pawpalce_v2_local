// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PetDetailsStore on _PetDetailsStore, Store {
  Computed<bool>? _$hasPetComputed;

  @override
  bool get hasPet => (_$hasPetComputed ??=
          Computed<bool>(() => super.hasPet, name: '_PetDetailsStore.hasPet'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_PetDetailsStore.isLoading', context: context);

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

  late final _$errorAtom =
      Atom(name: '_PetDetailsStore.error', context: context);

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

  late final _$futureAtom =
      Atom(name: '_PetDetailsStore.future', context: context);

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

  late final _$petAtom = Atom(name: '_PetDetailsStore.pet', context: context);

  @override
  PetModel? get pet {
    _$petAtom.reportRead();
    return super.pet;
  }

  @override
  set pet(PetModel? value) {
    _$petAtom.reportWrite(value, super.pet, () {
      super.pet = value;
    });
  }

  late final _$getPetDetailsAsyncAction =
      AsyncAction('_PetDetailsStore.getPetDetails', context: context);

  @override
  Future<PetModel?> getPetDetails(String petId) {
    return _$getPetDetailsAsyncAction.run(() => super.getPetDetails(petId));
  }

  late final _$deletePetAsyncAction =
      AsyncAction('_PetDetailsStore.deletePet', context: context);

  @override
  Future<bool> deletePet(String petId) {
    return _$deletePetAsyncAction.run(() => super.deletePet(petId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
future: ${future},
pet: ${pet},
hasPet: ${hasPet}
    ''';
  }
}
