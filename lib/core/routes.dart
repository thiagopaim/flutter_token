import 'package:flutter/foundation.dart';
import 'package:jwt/feature/auth/auth_page.dart';
import 'package:jwt/feature/home/home_page.dart';
import 'package:jwt/feature/welcome/welcome_page.dart';

final routes = {
  '/': (_) => const WelcomePage(),
  '/auth': (_) => const AuthPage(),
  '/home': (_) => const HomePage(),
};
