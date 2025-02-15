import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../features/phone_auth/ui/phone_auth_screen.dart';
import '../main_content.dart';

@RoutePage()
class AuthGuardScreen extends StatelessWidget {
  const AuthGuardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return const MainContent();
    } else {
      return const PhoneAuthScreen();
    }
  }
}
