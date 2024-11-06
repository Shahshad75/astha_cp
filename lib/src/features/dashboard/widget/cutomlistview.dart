import 'package:flutter/material.dart';

class CutomListTile extends StatelessWidget {
  const CutomListTile({super.key, required this.leading, required this.text});
  final String leading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(leading,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 13.0, fontFamily: "ReadexPro", color: Colors.grey)),
          Expanded(
            child: Text(text,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 13.0,
                    fontFamily: "ReadexPro",
                    color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
