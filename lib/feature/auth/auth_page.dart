import 'package:flutter/material.dart';
import 'package:jwt/components/form/button.dart';
import 'package:jwt/components/form/input.dart';
import 'package:jwt/feature/auth/auth_controller.dart';

import 'package:provider/provider.dart';
import 'package:jwt/providers/loading_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formLoginKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formLoginKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Input(
                  label: 'Email',
                  type: 'email',
                  validate: 'email',
                  controller: _emailController,
                ),
                Input(
                  label: 'Password',
                  type: 'password',
                  validate: 'password',
                  controller: _passwordController,
                ),
                Consumer<LoadingProvider>(
                  builder: ((
                    BuildContext context,
                    LoadingProvider value,
                    child,
                  ) {
                    return Button(
                      label: value.loading ? 'Loading...' : 'Access',
                      action: () {
                        controller.login(
                          context,
                          _formLoginKey,
                          _emailController,
                          _passwordController,
                        );
                      },
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
