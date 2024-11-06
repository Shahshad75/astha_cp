
import 'package:astha_cp/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DocumentBox extends StatelessWidget {
  const DocumentBox({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: primaryColor,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: SizedBox(
          height: 120,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: Image(image: AssetImage("assets/images/document.png")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 13,
                      fontFamily: "ReadexPro",
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
