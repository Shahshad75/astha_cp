import 'package:astha_cp/main.dart';
import 'package:astha_cp/src/features/authentication/login_screen.dart';
import 'package:astha_cp/src/features/dashboard/view/dashboard_screen.dart';
import 'package:astha_cp/src/network/local/sharedpref.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      final token = SharedPrefModel.instance.getData('token');
      print('tokne isssss $token');
      if (token != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return MainScreen();
        }));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return LoginScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image(image: AssetImage("assets/images/logo.png")),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "ASTHA",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "ReadexPro",
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
