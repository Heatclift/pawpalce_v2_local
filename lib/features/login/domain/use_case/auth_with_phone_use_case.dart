import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawplaces/common/data/models/user_session.dart';
import 'package:pawplaces/common/domain/use_cases/use_case.dart';

enum SMSAuthState {
  sent,
  timeout,
  failed,
  completed;
}

class CodeSentResponse {
  final FirebaseAuthException? error;
  final String? verificationId;
  final String? accessToken;
  final int? forceResendingToken;
  final UserSession? session;
  final SMSAuthState state;

  CodeSentResponse({
    this.error,
    this.accessToken,
    this.session,
    this.verificationId,
    this.forceResendingToken,
    required this.state,
  });
}

class AuthWithPhoneUsecase extends UseCase<CodeSentResponse, int> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<CodeSentResponse> call({int? params}) async {
    final responseCompleter = Completer<CodeSentResponse>();
    late CodeSentResponse response;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+$params',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          final userCredential = await auth.signInWithCredential(credential);
          final user = userCredential.user;
          final idToken = await user?.getIdToken();
          final session = UserSession(
            idToken: idToken,
            localId: user?.uid,
            isNewUser: userCredential.additionalUserInfo?.isNewUser ?? true,
            phoneNumber: user!.phoneNumber!,
          );
          response = CodeSentResponse(
            state: SMSAuthState.completed,
            accessToken: userCredential.credential?.accessToken,
            session: session,
          );

          responseCompleter.complete(response);
        },
        verificationFailed: (FirebaseAuthException error) {
          response = CodeSentResponse(state: SMSAuthState.failed);
          responseCompleter.complete(response);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          response = CodeSentResponse(
            state: SMSAuthState.sent,
            verificationId: verificationId,
            forceResendingToken: forceResendingToken,
          );
          responseCompleter.complete(response);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          response = CodeSentResponse(
            state: SMSAuthState.timeout,
            verificationId: verificationId,
          );
          responseCompleter.complete(response);
        },
      );
    } catch (e) {
      response = CodeSentResponse(state: SMSAuthState.failed);
      responseCompleter.complete(response);
    }
    return await responseCompleter.future;
  }
}
