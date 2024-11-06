import 'package:flutter/material.dart';

class ConsultationBox extends StatelessWidget {
  const ConsultationBox(
      {super.key,
      required this.count,
      required this.title,
      required this.color});
  final String count;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 70,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 21.0,
                fontFamily: "ReadexPro",
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18.0,
                fontFamily: "ReadexPro",
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
