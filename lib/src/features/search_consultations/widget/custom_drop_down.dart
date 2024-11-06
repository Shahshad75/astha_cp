import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hint,
    this.initial,
    required this.items,
    required this.onChanged,
  });

  final String hint;
  final String? initial;
  final List<String> items;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: DropdownButtonFormField<String>(
        hint: Text(
          hint,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        value: initial,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        isDense: true,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Color(0xff29536B),
        ),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
