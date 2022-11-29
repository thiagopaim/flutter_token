import 'package:flutter/material.dart';
import 'package:jwt/core/validator.dart';

class Input extends StatelessWidget {
  Input({
    Key? key,
    required type,
    required this.label,
    required TextEditingController controller,
    this.validate = '',
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String type = 'text';
  final String validate;
  final String label;

  final inputTypeMap = {
    'text': TextInputType.text,
    'number': TextInputType.number,
    'email': TextInputType.emailAddress,
  };

  final inputValidation = {
    'email': (value) => Validate.email(value),
    'password': (value) => Validate.password(value),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          keyboardType: applyInputType(type),
          validator: (value) {
            return applyValidation(value ?? '', validate);
          },
          decoration: InputDecoration(
            label: Text(label),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  applyInputType(type) {
    return inputTypeMap[type] ?? TextInputType.text;
  }

  applyValidation(value, validate) {
    return inputValidation[validate]!(value);
  }
}
