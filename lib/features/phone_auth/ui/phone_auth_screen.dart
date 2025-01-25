// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../cubit/phone_auth_cubit.dart';
//
// class PhoneAuthScreen extends StatefulWidget {
//   const PhoneAuthScreen({super.key});
//
//   @override
//   _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
// }
//
// class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();
//   String? _verificationId;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Phone Authentication'),
//       ),
//       body: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
//         listener: (context, state) {
//           if (state is PhoneAuthCodeSent) {
//             _verificationId = state.verificationId;
//           } else if (state is PhoneAuthSuccess) {
//             Navigator.pushReplacementNamed(context, '/home');
//           } else if (state is PhoneAuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state is PhoneAuthLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(labelText: 'Phone Number'),
//                   keyboardType: TextInputType.phone,
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.read<PhoneAuthCubit>().verifyPhoneNumber(_phoneController.text);
//                   },
//                   child: const Text('Send OTP'),
//                 ),
//                 const SizedBox(height: 16),
//                 if (_verificationId != null) ...[
//                   TextField(
//                     controller: _otpController,
//                     decoration: const InputDecoration(labelText: 'OTP'),
//                     keyboardType: TextInputType.number,
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       context.read<PhoneAuthCubit>().verifyOTP(_verificationId!, _otpController.text);
//                     },
//                     child: const Text('Verify OTP'),
//                   ),
//                 ],
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/phone_auth_cubit.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String? _verificationId;

  bool _isPhoneNumberValid(String phoneNumber) {
    // Simple regex to check if the phone number is in E.164 format
    final RegExp e164Regex = RegExp(r'^\+[1-9]\d{1,14}$');
    return e164Regex.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Authentication'),
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
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
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
                            content: Text(
                                'Please enter a valid phone number in E.164 format.')),
                      );
                    }
                  },
                  child: const Text('Send OTP'),
                ),
                const SizedBox(height: 16),
                if (_verificationId != null) ...[
                  TextField(
                    controller: _otpController,
                    decoration: const InputDecoration(labelText: 'OTP'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<PhoneAuthCubit>()
                          .verifyOTP(_verificationId!, _otpController.text);
                    },
                    child: const Text('Verify OTP'),
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
