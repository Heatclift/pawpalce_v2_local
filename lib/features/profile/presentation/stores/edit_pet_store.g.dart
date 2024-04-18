// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_pet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditPetStore on _EditPetStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EditPetStore.isLoading', context: context);

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
      Atom(name: '_EditPetStore.petAdded', context: context);

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
      Atom(name: '_EditPetStore.petname', context: context);

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
      Atom(name: '_EditPetStore.selectedPetType', context: context);

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
      Atom(name: '_EditPetStore.petTypes', context: context);

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

  late final _$errorAtom = Atom(name: '_EditPetStore.error', context: context);

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

  late final _$petAtom = Atom(name: '_EditPetStore.pet', context: context);

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

  late final _$futureAtom =
      Atom(name: '_EditPetStore.future', context: context);

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

  late final _$petPicAtom =
      Atom(name: '_EditPetStore.petPic', context: context);

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

  late final _$petPicBytesAtom =
      Atom(name: '_EditPetStore.petPicBytes', context: context);

  @override
  Uint8List? get petPicBytes {
    _$petPicBytesAtom.reportRead();
    return super.petPicBytes;
  }

  @override
  set petPicBytes(Uint8List? value) {
    _$petPicBytesAtom.reportWrite(value, super.petPicBytes, () {
      super.petPicBytes = value;
    });
  }

  late final _$initPetTypesAsyncAction =
      AsyncAction('_EditPetStore.initPetTypes', context: context);

  @override
  Future<void> initPetTypes(String? initPetType) {
    return _$initPetTypesAsyncAction.run(() => super.initPetTypes(initPetType));
  }

  late final _$initPetBreedAsyncAction =
      AsyncAction('_EditPetStore.initPetBreed', context: context);

  @override
  Future<void> initPetBreed() {
    return _$initPetBreedAsyncAction.run(() => super.initPetBreed());
  }

  late final _$getPetDetailsAsyncAction =
      AsyncAction('_EditPetStore.getPetDetails', context: context);

  @override
  Future<PetModel?> getPetDetails(String petId) {
    return _$getPetDetailsAsyncAction.run(() => super.getPetDetails(petId));
  }

  late final _$setPictureAsyncAction =
      AsyncAction('_EditPetStore.setPicture', context: context);

  @override
  Future<void> setPicture(XFile picture) {
    return _$setPictureAsyncAction.run(() => super.setPicture(picture));
  }

  late final _$updatedPetAsyncAction =
      AsyncAction('_EditPetStore.updatedPet', context: context);

  @override
  Future<void> updatedPet(
      {required String petName,
      required String petBirthdate,
      required String petGender,
      required String petColor,
      required String petRegistrationNumber,
      required String petId}) {
    return _$updatedPetAsyncAction.run(() => super.updatedPet(
        petName: petName,
        petBirthdate: petBirthdate,
        petGender: petGender,
        petColor: petColor,
        petRegistrationNumber: petRegistrationNumber,
        petId: petId));
  }

  late final _$_EditPetStoreActionController =
      ActionController(name: '_EditPetStore', context: context);

  @override
  void setSelectedPetType(String label) {
    final _$actionInfo = _$_EditPetStoreActionController.startAction(
        name: '_EditPetStore.setSelectedPetType');
    try {
      return super.setSelectedPetType(label);
    } finally {
      _$_EditPetStoreActionController.endAction(_$actionInfo);
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
error: ${error},
pet: ${pet},
future: ${future},
petPic: ${petPic},
petPicBytes: ${petPicBytes}
    ''';
  }
}
