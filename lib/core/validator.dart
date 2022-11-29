class Validate {
  static String? email(String email) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (regex.hasMatch(email)) return null;
    return 'Email looks invalid';
  }

  static String? password(String password) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (regex.hasMatch(password)) return null;
    return 'Password must be at least 6 characters';
  }
}
