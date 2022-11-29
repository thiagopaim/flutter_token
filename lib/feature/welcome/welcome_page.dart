import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    verifyToken().then((token) {
      if (token) {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/auth');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome Page'),
      ),
    );
  }

  verifyToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token') != null;
  }
}
