class SignUpValidator {
  /// Validates full name (simple checks)
  static String? validateFullName(String fullName) {
    if (fullName.trim().isEmpty) return 'Full name is required';
    if (fullName.trim().length < 2) return 'Full name must be at least 2 characters';
    if (fullName.trim().length > 80) return 'Full name must not exceed 80 characters';
    return null;
  }

  /// Validates username length and characters
  static String? validateUsername(String username) {
    if (username.trim().isEmpty) return 'Username is required';
    if (username.trim().length < 3) return 'Username must be at least 3 characters';
    if (username.trim().length > 30) return 'Username must not exceed 30 characters';
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username.trim())) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  /// Validates email format
  static String? validateEmail(String email) {
    if (email.trim().isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$');
    if (!emailRegex.hasMatch(email.trim())) return 'Please enter a valid email address';
    return null;
  }

  /// Validates password strength
  static String? validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 8) return 'Password must be at least 8 characters';
    if (password.length > 50) return 'Password must not exceed 50 characters';
    if (!RegExp(r'[A-Z]').hasMatch(password)) return 'Password must contain at least one uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(password)) return 'Password must contain at least one lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(password)) return 'Password must contain at least one digit';
    return null;
  }

  /// Validates agreement to terms
  static String? validateTerms(bool agreed) {
    if (!agreed) return 'You must agree to the terms';
    return null;
  }
}
