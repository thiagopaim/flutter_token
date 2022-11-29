import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    required this.action,
  });

  final String label;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.0,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          elevation: 0,
        ),
        child: Text(label),
      ),
    );
  }
}
