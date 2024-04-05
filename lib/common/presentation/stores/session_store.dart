import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:pawplaces/common/data/models/user_session.dart';
import 'package:pawplaces/common/domain/services/session_service.dart';

part 'session_store.g.dart';

class SessionStore extends _SessionStore with _$SessionStore {
  SessionStore() : super();
}

abstract class _SessionStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableFuture<dynamic> future = ObservableFuture.value(null);

  @observable
  UserSession? session;

  @computed
  bool get hasSession => session != null;

  @action
  Future<void> initSession() async {
    isLoading = true;
    future = ObservableFuture<UserSession?>(SessionService.getSession());
    session = await future;
    // print("token: ${session?.localId}");
    isLoading = false;
  }

  @action
  Future<void> logOut() async {
    isLoading = true;
    FirebaseAuth.instance.signOut();
    SessionService.deleteSession();
    session = null;
    isLoading = false;
  }
}
