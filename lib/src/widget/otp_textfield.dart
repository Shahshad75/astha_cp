// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class OTPfield extends StatelessWidget {
//   const OTPfield({super.key,required this.otp});
//  final int otp;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//       child: PinCodeTextField(
//         length: 6,
//         obscureText: false,
//         animationType: AnimationType.fade,
//         pinTheme: PinTheme(
//           shape: PinCodeFieldShape.box,
//           borderRadius: BorderRadius.circular(10),
//           fieldHeight: 50,
//           fieldWidth: 40,
//           activeFillColor: Colors.white,
//           inactiveFillColor: Colors.white,
//           selectedFillColor: Colors.white,
//           activeColor: Colors.transparent,
//           inactiveColor: Colors.transparent,
//           selectedColor: Colors.transparent,
//         ),
//         animationDuration: const Duration(milliseconds: 300),
//         backgroundColor: Colors.transparent,
//         enableActiveFill: true,
//         onCompleted: (value) {
//           print(value);
//         },
//         onChanged: (value) {
//           print(value);
//         },
//         beforeTextPaste: (text) {
//           return true;
//         },
//         appContext: context,
//       ),
//     );
//   }
// }
