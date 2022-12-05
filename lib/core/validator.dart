class Validate {
  static String? email(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (regex.hasMatch(email)) return null;
    return 'Email looks invalid';
  }

  static String? password(String password) {
    Pattern pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z!@#$%^&*]).{6,15}$';
    RegExp regex = RegExp(pattern as String);
    if (regex.hasMatch(password)) return null;
    return 'Password must be at least 6 and maximum of 15 characters';
  }
}
