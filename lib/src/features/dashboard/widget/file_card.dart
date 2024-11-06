import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';

class FileCard extends StatelessWidget {
  const FileCard({super.key, required this.shadow});
  final bool shadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(boxShadow:shadow? [
        BoxShadow(
          color: const Color.fromARGB(255, 227, 227, 227).withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ]:[], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.white,
        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.grey),
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
        ),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xffEEF8FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Image(
            image: AssetImage("assets/images/small_doc.png"),
          ),
        ),
        title: const Text(
          "File name",
          style: TextStyle(
              color: Color.fromARGB(255, 33, 33, 33),
              fontFamily: "ReadexPro",
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        subtitle: const Text(
          "PDF",
          style: TextStyle(
              fontSize: 12,
              color: primaryColor,
              fontFamily: "ReadexPro",
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
