// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  String name;
  VoidCallback onChanged;

  CustomButtons({
    super.key,
    required this.name,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: MaterialButton(
          onPressed: onChanged,
          color: Colors.blue,
          child: Text(name),
        ),
      ),
    );
  }
}
