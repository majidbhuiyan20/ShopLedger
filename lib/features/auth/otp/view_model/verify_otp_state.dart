class VerifyOtpState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  VerifyOtpState({this.isLoading = false, this.error, this.isSuccess = false});

  VerifyOtpState copyWith({bool? isLoading, String? error, bool? isSuccess}) {
    return VerifyOtpState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
