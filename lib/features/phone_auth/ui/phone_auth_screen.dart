import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/widgets/custom_circular_indicator.dart';

import '../cubit/phone_auth_cubit.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  PhoneAuthScreenState createState() => PhoneAuthScreenState();
}

class PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String? _verificationId;

  bool _isPhoneNumberValid(String phoneNumber) {
    final RegExp regExp = RegExp(r'^\+[1-9]\d{1,14}$');
    return regExp.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('LOKO ВПЕРЕД!!!'),
      ),
      body: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
        listener: (context, state) {
          if (state is PhoneAuthCodeSent) {
            _verificationId = state.verificationId;
          } else if (state is PhoneAuthSuccess) {
            Navigator.pushReplacementNamed(context, '/news');
          } else if (state is PhoneAuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is PhoneAuthLoading) {
            return const Center(child: FootballLoadingIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _phoneController,
                  decoration:
                      const InputDecoration(labelText: 'Номер телефону'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final phoneNumber = _phoneController.text;
                    if (_isPhoneNumberValid(phoneNumber)) {
                      context
                          .read<PhoneAuthCubit>()
                          .verifyPhoneNumber(phoneNumber);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Невірний формат.')),
                      );
                    }
                  },
                  child: const Text('Отримати SMS'),
                ),
                const SizedBox(height: 16),
                if (_verificationId != null) ...[
                  TextField(
                    controller: _otpController,
                    decoration: const InputDecoration(labelText: 'Код з SMS'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<PhoneAuthCubit>()
                          .verifyOTP(_verificationId!, _otpController.text);
                    },
                    child: const Text("Відправити код"),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
