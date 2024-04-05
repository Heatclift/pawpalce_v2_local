import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/common/data/models/user_session.dart';
import 'package:pawplaces/common/domain/injectors/dependecy_injector.dart';
import 'package:pawplaces/common/domain/repository/session_repository.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';
import 'package:pawplaces/features/login/presentation/stores/authentication_store.dart';

part 'session_store.g.dart';

class SessionStore extends _SessionStore with _$SessionStore {
  SessionStore() : super();
}

abstract class _SessionStore with Store {
  final sessionRepo = SessionRepository();

  @observable
  bool isLoading = false;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  UserSession? session;

  @observable
  bool hasProfile = false;

  @computed
  bool get hasSession => session != null;

  @action
  Future<void> initSession() async {
    isLoading = true;
    future = ObservableFuture<UserSession?>(SessionService.getSession());
    session = await future;
    if (hasSession) {
      final phoneCheckResult =
          await sessionRepo.checkNumber(int.parse(session!.phoneNumber));
      hasProfile = phoneCheckResult?.isProfileUpdated ?? false;
    }
    // print("token: ${session?.localId}");
    isLoading = false;
  }

  @action
  Future<void> logOut() async {
    isLoading = true;
    FirebaseAuth.instance.signOut();
    SessionService.deleteSession();
    dpLocator<AuthenticationStore>().logOut();
    session = null;
    isLoading = false;
  }
}
