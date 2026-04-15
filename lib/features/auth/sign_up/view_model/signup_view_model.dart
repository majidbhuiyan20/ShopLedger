import 'package:shop_ledger/features/auth/sign_up/view_model/sign_up_state.dart';
import 'package:shop_ledger/models/auth/sign_up_request.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../data/repositories/auth_repository.dart';

/// Professional Sign Up View Model with proper state management and API integration
class SignupViewModel extends StateNotifier<SignUpState> {
  final AuthRepository repo;

  SignupViewModel(this.repo) : super(const SignUpState());

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Validation Methods
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  /// Validates username length and format
  String? _validateUsername(String username) {
    if (username.trim().isEmpty) {
      return 'Username is required';
    }
    if (username.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }
    if (username.trim().length > 30) {
      return 'Username must not exceed 30 characters';
    }
    // Check if username contains only alphanumeric and underscore
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username.trim())) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  /// Validates email format
  String? _validateEmail(String email) {
    if (email.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates password strength
  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (password.length > 50) {
      return 'Password must not exceed 50 characters';
    }
    // Check for at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }
    // Check for at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }
    // Check for at least one digit
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one digit';
    }
    return null;
  }

  /// Validates if terms are agreed
  String? _validateTerms(bool agreed) {
    if (!agreed) {
      return 'You must agree to the terms and conditions';
    }
    return null;
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Form Validation
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  /// Validates the entire signup form
  /// Returns true if all fields are valid, false otherwise
  bool validateForm(
    String username,
    String email,
    String password,
    bool agreedToTerms,
  ) {
    state = state.clearErrors();

    final usernameError = _validateUsername(username);
    final emailError = _validateEmail(email);
    final passwordError = _validatePassword(password);
    final termsError = _validateTerms(agreedToTerms);

    // If there are any errors, update state and return false
    if (usernameError != null ||
        emailError != null ||
        passwordError != null ||
        termsError != null) {
      state = state.copyWith(
        usernameError: usernameError,
        emailError: emailError,
        passwordError: passwordError,
        termsError: termsError,
      );
      return false;
    }

    // All validations passed
    return true;
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // API Integration
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  /// Performs the signup API call
  /// Saves user data in state after successful registration
  /// Returns true if signup is successful, false otherwise
  Future<bool> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    // Start loading state
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Create signup request
      final request = SignUpRequest(
        fullName: username, // Using username as fullName for now
        userName: username,
        email: email,
        password: password,
      );

      // Call API
      final response = await repo.signUp(request);

      if (response.isSuccess) {
        // Save user data for OTP verification
        state = state.copyWith(
          isLoading: false,
          userRegistered: true,
          registeredEmail: email,
          registeredUsername: username,
          registeredPassword: password,
          error: null,
        );
        return true;
      } else {
        // Handle API error
        state = state.copyWith(
          isLoading: false,
          error: response.errorMessage ?? 'Failed to create account',
        );
        return false;
      }
    } catch (e) {
      // Handle exception
      state = state.copyWith(
        isLoading: false,
        error: 'An error occurred: ${e.toString()}',
      );
      return false;
    }
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // State Management
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  /// Clears all errors from the state
  void clearErrors() {
    state = state.clearErrors();
  }

  /// Resets the entire signup state
  void reset() {
    state = state.reset();
  }

  /// Mark OTP as sent (used after successful signup)
  void markOtpSent() {
    state = state.copyWith(otpSent: true);
  }

  /// Clear success states
  void clearSuccess() {
    state = state.copyWith(userRegistered: false, success: false);
  }
}
