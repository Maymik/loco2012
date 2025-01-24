part of 'phone_auth_cubit.dart';

@immutable
abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthCodeSent extends PhoneAuthState {
  final String verificationId;

  PhoneAuthCodeSent({required this.verificationId});
}

class PhoneAuthSuccess extends PhoneAuthState {}

class PhoneAuthFailure extends PhoneAuthState {
  final String message;

  PhoneAuthFailure(this.message);
}
