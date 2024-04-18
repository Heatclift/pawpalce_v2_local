import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pawplaces/features/register/domain/repositories/register_repository.dart';
import 'package:pawplaces/features/register/presentation/widgets/register_success_dialog.dart';
import 'package:pawplaces/main.dart';

part 'register_store.g.dart';

class RegistrationStore extends _RegistrationStore with _$RegistrationStore {
  RegistrationStore() : super();
}

abstract class _RegistrationStore with Store {
  final regRepo = RegisterRepository();

  @observable
  bool isLoading = false;

  @observable
  bool isRegistered = false;

  @observable
  bool isTermsAgreed = false;

  @observable
  String? error;

  @observable
  String? phoneNumber;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  ReactionDisposer? errorReactDispose;
  ReactionDisposer? registerReactionDispose;

  void disposeReactions() {
    errorReactDispose?.call();
    registerReactionDispose?.call();
  }

  void setupReactions(BuildContext context) {
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
    registerReactionDispose = when((p0) => isRegistered, () async {
      var sesionStore = dpLocator<SessionStore>();
      sesionStore.initSession();
      await showDialog(
        context: context,
        builder: (context) => const RegistesSuccessDialog(),
      );
      router.goNamed(Dashboard.routeName);
    });
  }

  @action
  Future<bool> register({
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String? photo,
  }) async {
    isLoading = true;
    error = null;
    var phoneInt = phoneNumber.replaceAll("+", "");
    phoneInt = phoneInt.replaceAll(' ', '');
    future = ObservableFuture(
      regRepo.createAccount(
        phoneNumber: phoneInt,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        photo: photo,
      ),
    );

    var sendResponse = await future as bool;

    if (!sendResponse) {
      error = "Can't Register right now :(";
    }

    isRegistered = sendResponse;
    isLoading = false;
    return sendResponse;
  }
}
