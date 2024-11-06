import 'package:flutter/material.dart';

class CutomTextfield extends StatelessWidget {
  const CutomTextfield(
      {super.key,
      required this.text,
      this.maxLine,
      this.minLine,
      this.isObscure,
      required this.validator,
      this.suffixIcon,
      required this.controller});
  final FormFieldValidator validator;
  final String text;
  final int? maxLine;
  final TextEditingController? controller;
  final int? minLine;
  final bool? isObscure;
  final Icon? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLine ?? 1,
        minLines: minLine ?? 1,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: text,
            hintStyle: const TextStyle(
                fontFamily: "ReadexPro",
                fontSize: 14,
                color: Color(0xffD0D0D0)),
            filled: true,
            fillColor: const Color(0xFFF9F9F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            isDense: true),
        obscureText: isObscure ?? false,
      ),
    );
  }
}
