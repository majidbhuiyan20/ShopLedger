import 'package:flutter_riverpod/legacy.dart';
import 'package:shop_ledger/data/repositories/auth_repository.dart';
import 'package:shop_ledger/features/auth/otp/view_model/verify_otp_state.dart';
import 'package:shop_ledger/models/auth/otp_request.dart';

import '../../sign_up/view_model/sign_up_provider.dart';

class VerifyOtpViewModel extends StateNotifier<VerifyOtpState>{
  final AuthRepository repository;
  VerifyOtpViewModel(this.repository) : super(VerifyOtpState());

  Future<void> verifyOtp(String email, String otp)async{
    state = state.copyWith(isLoading: true, error: null);
    try {
      final request = OtpRequest(email: email.trim(), otp: otp);
      final response = await repository.verifyOtp(request);
      if (response.isSuccess) {
        state = state.copyWith(isLoading: false, isSuccess: true);
      }
      else{
        state = state.copyWith(isLoading: false, error: response.errorMessage ?? "Verify Otp Field");
      }
    }
    catch(e){
      state = state.copyWith(isLoading: false, error: "Network Error: ${e.toString()}");
    }
  }
}

final verifyOtpViewModelProvider = StateNotifierProvider<VerifyOtpViewModel, VerifyOtpState>((ref){
  final repository = ref.read(authRepositoryProvider);
  return VerifyOtpViewModel(repository);
});

