// ignore_for_file: library_private_types_in_public_api

import 'package:astha_cp/main.dart';
import 'package:astha_cp/src/controller/login_bloc/login_bloc.dart';
import 'package:astha_cp/src/features/authentication/homescreen.dart';
import 'package:astha_cp/src/widget/button.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:astha_cp/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});
  final String email;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initNotifications();
  }

  // Initialize local notifications
  void _initNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Function to show the OTP notification
  void showOtpNotification(String otp) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'otp_channel', // Channel ID
      'OTP Notifications', // Channel Name
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'OTP Received',
      'Your OTP is: $otp',
      platformChannelSpecifics,
      payload: otp,
    );
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: SingleChildScrollView(
            // Make the whole body scrollable
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Use min size to prevent overflow
              children: [
                const SizedBox(
                  child: Column(children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "ReadexPro",
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Please login to continue",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "ReadexPro",
                          color: Colors.white),
                    ),
                  ]),
                ),
                const SizedBox(
                  child: Image(image: AssetImage("assets/images/otpimage.png")),
                ),
                OTPfield(
                  otpController: otpController,
                ),
                const Center(
                  child: Text(
                    "Not received? Send again",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "ReadexPro",
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20), // Add some spacing
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginloadingState) {
                      isLoading = true;
                    } else if (state is OtpLoginSucessState) {
                      isLoading = false;
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (ctx) {
                        return const MainScreen();
                      }));
                      CustomSnackBar.showSnackBar(context, state.message);
                    } else if (state is OtpLoginFailedState) {
                      isLoading = false;
                      CustomSnackBar.showSnackBar(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return CustomButtom(
                      onTap: () {
                        if (otpController.text.isNotEmpty) {
                          context.read<LoginBloc>().add(LoginWithOtpEvent(
                              otp: otpController.text.trim(),
                              email: widget.email));
                        } else {
                          CustomSnackBar.showSnackBar(
                              context, "Please enter valid otp");
                        }
                      },
                      text: "Verify OTP",
                      color: primaryColor,
                      textColor: Colors.white,
                      borderColor: Colors.white,
                      radius: 30,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTPfield extends StatelessWidget {
  const OTPfield({super.key, required this.otpController});
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: PinCodeTextField(
        length: 6,
        controller: otpController,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          activeColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          selectedColor: Colors.transparent,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        onCompleted: (value) {},
        onChanged: (value) {},
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }
}
