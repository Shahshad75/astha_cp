
import 'package:astha_cp/src/features/setting/widget/setting_tile.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: [
          SettingTile(
            imagePath: "assets/images/about.png",
            title: "About us",
            onTap: () {},
          ),
          SettingTile(
            imagePath: "assets/images/resetpassword.png",
            title: "Reset password",
            onTap: () {},
          ),
          SettingTile(
            imagePath: "assets/images/term.png",
            title: "Terms & Conditions",
            onTap: () {},
          ),
          SettingTile(
            imagePath: "assets/images/term.png",
            title: "Privacy policy",
            onTap: () {},
          ),
          SettingTile(
            imagePath: "assets/images/update.png",
            title: "Check for update",
            onTap: () {},
          ),
          SettingTile(
            imagePath: "assets/images/feedback.png",
            title: "Send feedback",
            onTap: () {},
          ),
          SettingTile(
            imagePath: "assets/images/logout.png",
            title: "Logout",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
