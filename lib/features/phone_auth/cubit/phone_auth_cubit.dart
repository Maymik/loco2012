import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
          emit(PhoneAuthSuccess());
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(PhoneAuthFailure(e.message ?? 'Verification failed'));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(PhoneAuthCodeSent(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(PhoneAuthFailure(e.toString()));
    }
  }

  Future<void> verifyOTP(String verificationId, String smsCode) async {
    emit(PhoneAuthLoading());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _firebaseAuth.signInWithCredential(credential);
      emit(PhoneAuthSuccess());
    } catch (e) {
      emit(PhoneAuthFailure(e.toString()));
    }
  }
}
