class SignUpState {
  // ── Loading States ────────────────────────────────────
  final bool isLoading;
  final bool isValidating;
  final bool isSendingOtp;

  // ── Success States ────────────────────────────────────
  final bool success;
  final bool otpSent;
  final bool userRegistered;

  // ── Error States ──────────────────────────────────────
  final String? error;
  final String? usernameError;
  final String? emailError;
  final String? passwordError;
  final String? termsError;

  // ── Data ──────────────────────────────────────────────
  final String? registeredEmail;
  final String? registeredUsername;
  final String? registeredPassword;

  const SignUpState({
    // Loading States
    this.isLoading = false,
    this.isValidating = false,
    this.isSendingOtp = false,

    // Success States
    this.success = false,
    this.otpSent = false,
    this.userRegistered = false,

    // Error States
    this.error,
    this.usernameError,
    this.emailError,
    this.passwordError,
    this.termsError,

    // Data
    this.registeredEmail,
    this.registeredUsername,
    this.registeredPassword,
  });

  /// Creates a copy of this state with selected fields replaced
  SignUpState copyWith({
    bool? isLoading,
    bool? isValidating,
    bool? isSendingOtp,
    bool? success,
    bool? otpSent,
    bool? userRegistered,
    String? error,
    String? usernameError,
    String? emailError,
    String? passwordError,
    String? termsError,
    String? registeredEmail,
    String? registeredUsername,
    String? registeredPassword,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      isValidating: isValidating ?? this.isValidating,
      isSendingOtp: isSendingOtp ?? this.isSendingOtp,
      success: success ?? this.success,
      otpSent: otpSent ?? this.otpSent,
      userRegistered: userRegistered ?? this.userRegistered,
      error: error,
      usernameError: usernameError,
      emailError: emailError,
      passwordError: passwordError,
      termsError: termsError,
      registeredEmail: registeredEmail ?? this.registeredEmail,
      registeredUsername: registeredUsername ?? this.registeredUsername,
      registeredPassword: registeredPassword ?? this.registeredPassword,
    );
  }

  /// Clears all error messages
  SignUpState clearErrors() {
    return copyWith(
      error: null,
      usernameError: null,
      emailError: null,
      passwordError: null,
      termsError: null,
    );
  }

  /// Resets the signup state to initial state
  SignUpState reset() {
    return const SignUpState();
  }
}
