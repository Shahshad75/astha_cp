import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  const TextTile({super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "ReadexPro",
                  color: Color.fromARGB(255, 112, 112, 112)),
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 14, fontFamily: "ReadexPro", color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
