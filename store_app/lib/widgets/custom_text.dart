import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({required this.hintname, this.onchange, this.inputType});
  String? hintname;
  Function(String)? onchange;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        keyboardType: inputType,
        onChanged: onchange,
        decoration: InputDecoration(
          hintText: hintname,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
