import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawplaces/common/data/models/user_session.dart';
import 'package:pawplaces/common/domain/use_cases/use_case.dart';

class VerifyPhoneUseCase
    extends UseCase<UserSession?, ({String verificationId, String smsCode})> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserSession?> call(
      {({String smsCode, String verificationId})? params}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: params!.verificationId,
      smsCode: params.smsCode,
    );

    try {
      final userCredential = await auth.signInWithCredential(credential);
      final user = userCredential.user;
      final idToken = await user?.getIdToken();
      final session = UserSession(
        idToken: idToken,
        localId: user?.uid,
        isNewUser: userCredential.additionalUserInfo?.isNewUser ?? true,
        phoneNumber: user!.phoneNumber!,
      );
      return session;
    } catch (e) {
      // Handle verification failure
      return null;
    }
  }
}
