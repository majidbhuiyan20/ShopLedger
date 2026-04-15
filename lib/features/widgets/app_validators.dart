class AppValidators {
  // Email Validator
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }

    return null;
  }

  // Password Validator
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "Minimum 8 characters required";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "At least 1 uppercase required";
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "At least 1 lowercase required";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "At least 1 number required";
    }

    return null;
  }

  //  Name Validator
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }

    if (value.length < 3) {
      return "Name too short";
    }

    return null;
  }
}