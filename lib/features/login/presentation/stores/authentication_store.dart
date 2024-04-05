import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/common/data/models/user_session.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/common/presentation/stores/session_store.dart';
import 'package:pawplaces/features/dashboard/data/models/place_model.dart';
import 'package:pawplaces/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pawplaces/features/login/domain/repositories/authentication_repo.dart';
import 'package:pawplaces/features/login/domain/use_case/auth_with_phone_use_case.dart';
import 'package:pawplaces/features/login/domain/use_case/verify_phone_use_case.dart';
import 'package:pawplaces/features/login/presentation/screens/verify_otp_screen.dart';
import 'package:pawplaces/features/register/presentation/screens/register_screen.dart';

part 'authentication_store.g.dart';

class AuthenticationStore extends _AuthenticationStore
    with _$AuthenticationStore {
  AuthenticationStore() : super();
}

abstract class _AuthenticationStore with Store {
  final verifyPhoneUsecase = VerifyPhoneUseCase();
  final authWithPHoneUseCase = AuthWithPhoneUsecase();
  final authRepo = AuthenticationRepository();

  @observable
  bool isLoading = false;

  @observable
  bool isAuthenticated = false;

  @observable
  bool isNewAccount = false;

  @observable
  bool isSMSSent = false;

  @observable
  String? error;

  @observable
  String? phoneNumber;

  @observable
  String? verificationId;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  ObservableList<PlaceModel> places = ObservableList.of(<PlaceModel>[]);

  ReactionDisposer? errorReactDispose;
  ReactionDisposer? smsSentReactDispose;
  ReactionDisposer? authReactDispose;
  ReactionDisposer? createAccountReactDispose;
  ReactionDisposer? sessionReactDispose;

  void disposeReactions() {
    errorReactDispose?.call();
    smsSentReactDispose?.call();
    authReactDispose?.call();
    sessionReactDispose?.call();
    createAccountReactDispose?.call();
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
    smsSentReactDispose = when(
      (p0) => isSMSSent,
      () {
        context.goNamed(VerifyOTPScreen.routeName);
      },
    );

    sessionReactDispose = reaction(
      (p0) => isAuthenticated,
      (p0) {
        var sesionStore = dpLocator<SessionStore>();
        sesionStore.initSession();
      },
    );

    createAccountReactDispose = when(
      (p0) => isAuthenticated && isNewAccount,
      () {
        context.goNamed(Register.routeName);
      },
    );
    authReactDispose = when(
      (p0) => isAuthenticated && !isNewAccount,
      () {
        context.goNamed(Dashboard.routeName);
      },
    );
  }

  @action
  Future<String?> verifyPhoneNumber(String phoneNumber) async {
    isLoading = true;
    error = null;
    var phoneInt = phoneNumber.replaceAll("+", "");
    phoneInt = phoneInt.replaceAll(' ', '');
    future =
        ObservableFuture(authWithPHoneUseCase(params: int.parse(phoneInt)));
    var sendResponse = await future as CodeSentResponse?;
    if (sendResponse != null) {
      final state = sendResponse.state;
      switch (state) {
        case SMSAuthState.completed:
          SessionService.saveSession(sendResponse.session!);
          error = null;
          isAuthenticated = true;
          isNewAccount = sendResponse.session!.isNewUser;
        case SMSAuthState.sent:
          isSMSSent = true;
          break;
        case SMSAuthState.failed:
          isSMSSent = false;
          error = "Can't send OTP";
          break;
        case SMSAuthState.timeout:
          isSMSSent = false;
          error = "Can't send OTP";
          break;
      }
      isLoading = false;
      verificationId = sendResponse.verificationId;
      return verificationId;
    } else {
      isSMSSent = false;
      error = "Can't send OTP";
    }
    isLoading = false;
    return null;
  }

  @action
  Future<UserSession?> loginWithNumber(String code) async {
    isLoading = true;
    error = null;
    future = ObservableFuture(verifyPhoneUsecase(
        params: (smsCode: code, verificationId: verificationId!)));
    var session = await future as UserSession?;
    if (session != null) {
      SessionService.saveSession(session);
      error = null;
      isAuthenticated = true;
      isNewAccount = session.isNewUser;
      isLoading = false;
      return session;
    } else {
      isAuthenticated = false;
      error = "Invalid OTP";
    }
    isLoading = false;
    return null;
  }
}
