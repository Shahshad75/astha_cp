import 'package:flutter/material.dart';

class CutomIconTile extends StatelessWidget {
  const CutomIconTile({super.key, required this.logoUrl, required this.text});
  final String logoUrl;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SizedBox(
            height: 25,
            child: Image(image: AssetImage(logoUrl)),
          ),
          Text(
            text.length > 20 ? '${text.substring(0, 20)}...' : text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15.0,
              fontFamily: "ReadexPro",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
