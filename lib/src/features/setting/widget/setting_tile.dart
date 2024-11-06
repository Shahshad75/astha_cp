import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile(
      {super.key, this.onTap, required this.imagePath, required this.title});
  final void Function()? onTap;
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Colors.white,
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: primaryColor,
            )),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xffEEF8FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image(
            image: AssetImage(imagePath),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(255, 33, 33, 33),
              fontFamily: "ReadexPro",
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
