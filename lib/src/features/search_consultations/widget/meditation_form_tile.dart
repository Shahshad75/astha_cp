import 'package:flutter/material.dart';

class MeditationFormTile extends StatelessWidget {
  const MeditationFormTile({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff29536B),
          ),
        ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }
}