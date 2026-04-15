import 'package:flutter_riverpod/legacy.dart';
import 'package:shop_ledger/features/auth/sign_up/view_model/sign_up_state.dart';
import 'package:shop_ledger/features/auth/sign_up/view_model/signup_view_model.dart';

import '../../../../core/network/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/remote/auth_remote_service.dart';
import '../../../../data/repositories/auth_repository.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final authRemoteServiceProvider = Provider((ref) {
  return AuthRemoteService(apiClient: ref.read(apiClientProvider));
});

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(remoteService: ref.read(authRemoteServiceProvider));
});

final signUpProvider = StateNotifierProvider<SignupViewModel, SignUpState>((ref){
  final repository = ref.read(authRepositoryProvider);
  return SignupViewModel(repository);
});