import 'package:flutter/material.dart';
import 'package:jwt/feature/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';
import 'package:jwt/providers/loading_provider.dart';

final Auth _auth = Auth();

class AuthController {
  Future<void> login(
    context,
    formLoginKey,
    emailController,
    passwordController,
  ) async {
    Provider.of<LoadingProvider>(
      context,
      listen: false,
    ).setLoadingStatus(true);

    if (formLoginKey.currentState!.validate()) {
      dynamic response = await _auth.login(
        emailController.text,
        passwordController.text,
      );

      if (response['error']?.isNotEmpty == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${response['error']}'),
          backgroundColor: Colors.red.shade300,
        ));

        Provider.of<LoadingProvider>(
          context,
          listen: false,
        ).setLoadingStatus(false);

        return;
      }

      final store = await SharedPreferences.getInstance();
      await store.setString('token', response['token']);

      Navigator.pushNamed(context, '/home');
    }
  }
}
