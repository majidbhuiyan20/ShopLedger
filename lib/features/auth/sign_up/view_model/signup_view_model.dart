import 'package:shop_ledger/features/auth/sign_up/view_model/sign_up_state.dart';
import 'package:shop_ledger/models/auth/sign_up_request.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../data/repositories/auth_repository.dart';

/// Professional Sign Up View Model with API integration
/// Validation is handled in the UI layer via SignUpValidator
class SignupViewModel extends StateNotifier<SignUpState> {
  final AuthRepository repo;

  SignupViewModel(this.repo) : super(const SignUpState());

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // API Integration
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  /// Performs the signup API call
  /// Saves user data in state after successful registration
  /// Returns true if signup is successful, false otherwise
  ///
  /// Note: Form validation should be done in the UI layer before calling this
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
        fullName: username,
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
