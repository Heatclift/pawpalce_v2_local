// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_pet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddPetStore on _AddPetStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_AddPetStore.isLoading', context: context);

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

  late final _$petAddedAtom =
      Atom(name: '_AddPetStore.petAdded', context: context);

  @override
  bool get petAdded {
    _$petAddedAtom.reportRead();
    return super.petAdded;
  }

  @override
  set petAdded(bool value) {
    _$petAddedAtom.reportWrite(value, super.petAdded, () {
      super.petAdded = value;
    });
  }

  late final _$petnameAtom =
      Atom(name: '_AddPetStore.petname', context: context);

  @override
  String? get petname {
    _$petnameAtom.reportRead();
    return super.petname;
  }

  @override
  set petname(String? value) {
    _$petnameAtom.reportWrite(value, super.petname, () {
      super.petname = value;
    });
  }

  late final _$selectedPetTypeAtom =
      Atom(name: '_AddPetStore.selectedPetType', context: context);

  @override
  PetType? get selectedPetType {
    _$selectedPetTypeAtom.reportRead();
    return super.selectedPetType;
  }

  @override
  set selectedPetType(PetType? value) {
    _$selectedPetTypeAtom.reportWrite(value, super.selectedPetType, () {
      super.selectedPetType = value;
    });
  }

  late final _$petTypesAtom =
      Atom(name: '_AddPetStore.petTypes', context: context);

  @override
  ObservableList<PetType> get petTypes {
    _$petTypesAtom.reportRead();
    return super.petTypes;
  }

  @override
  set petTypes(ObservableList<PetType> value) {
    _$petTypesAtom.reportWrite(value, super.petTypes, () {
      super.petTypes = value;
    });
  }

  late final _$petBreedsAtom =
      Atom(name: '_AddPetStore.petBreeds', context: context);

  @override
  ObservableList<PetType> get petBreeds {
    _$petBreedsAtom.reportRead();
    return super.petBreeds;
  }

  @override
  set petBreeds(ObservableList<PetType> value) {
    _$petBreedsAtom.reportWrite(value, super.petBreeds, () {
      super.petBreeds = value;
    });
  }

  late final _$errorAtom = Atom(name: '_AddPetStore.error', context: context);

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

  late final _$futureAtom = Atom(name: '_AddPetStore.future', context: context);

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

  late final _$petPicAtom = Atom(name: '_AddPetStore.petPic', context: context);

  @override
  XFile? get petPic {
    _$petPicAtom.reportRead();
    return super.petPic;
  }

  @override
  set petPic(XFile? value) {
    _$petPicAtom.reportWrite(value, super.petPic, () {
      super.petPic = value;
    });
  }

  late final _$initPetTypesAsyncAction =
      AsyncAction('_AddPetStore.initPetTypes', context: context);

  @override
  Future<void> initPetTypes() {
    return _$initPetTypesAsyncAction.run(() => super.initPetTypes());
  }

  late final _$initPetBreesAsyncAction =
      AsyncAction('_AddPetStore.initPetBrees', context: context);

  @override
  Future<void> initPetBrees([String? typeId]) {
    return _$initPetBreesAsyncAction.run(() => super.initPetBrees(typeId));
  }

  late final _$setPictureAsyncAction =
      AsyncAction('_AddPetStore.setPicture', context: context);

  @override
  Future<void> setPicture(XFile picture) {
    return _$setPictureAsyncAction.run(() => super.setPicture(picture));
  }

  late final _$addPetAsyncAction =
      AsyncAction('_AddPetStore.addPet', context: context);

  @override
  Future<void> addPet(
      {required String petName,
      required String petBirthdate,
      String? petBreedId,
      required String petGender,
      required String petColor,
      required String petRegistrationNumber}) {
    return _$addPetAsyncAction.run(() => super.addPet(
        petName: petName,
        petBirthdate: petBirthdate,
        petBreedId: petBreedId,
        petGender: petGender,
        petColor: petColor,
        petRegistrationNumber: petRegistrationNumber));
  }

  late final _$_AddPetStoreActionController =
      ActionController(name: '_AddPetStore', context: context);

  @override
  void setSelectedPetType(String label) {
    final _$actionInfo = _$_AddPetStoreActionController.startAction(
        name: '_AddPetStore.setSelectedPetType');
    try {
      return super.setSelectedPetType(label);
    } finally {
      _$_AddPetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
petAdded: ${petAdded},
petname: ${petname},
selectedPetType: ${selectedPetType},
petTypes: ${petTypes},
petBreeds: ${petBreeds},
error: ${error},
future: ${future},
petPic: ${petPic}
    ''';
  }
}
