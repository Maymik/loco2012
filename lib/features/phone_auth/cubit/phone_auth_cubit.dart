import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _signInAndCreateUser(credential, phoneNumber);
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
      await _signInAndCreateUser(credential, null);
    } catch (e) {
      emit(PhoneAuthFailure(e.toString()));
    }
  }

  Future<void> _signInAndCreateUser(
      PhoneAuthCredential credential, String? phoneNumber) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        final phone = phoneNumber ?? user.phoneNumber;

        if (phone != null) {
          await _firestore.collection('users').doc(user.uid).set({
            'id': user.uid,
            'phone': phone,
          }, SetOptions(merge: true));
        }

        emit(PhoneAuthSuccess());
      } else {
        emit(PhoneAuthFailure('User is null'));
      }
    } catch (e) {
      emit(PhoneAuthFailure(e.toString()));
    }
  }
}
