import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      required this.textColor,
      required this.borderColor,
      required this.radius,
      this.size,
      this.isLoading = false,
      this.padding});
  final void Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double radius;
  final double? size;
  final double? padding;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: padding ?? 10.0, vertical: 10),
        child: Container(
          height: size ?? 54,
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: borderColor),
              borderRadius: BorderRadius.circular(radius),
              color: color),
          child: Center(
            child: isLoading
                ? Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Colors.white,
                    ))
                : Text(
                    text,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "ReadexPro",
                        color: textColor,
                        fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
  }
}
