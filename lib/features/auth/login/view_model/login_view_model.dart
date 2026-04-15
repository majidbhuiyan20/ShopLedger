import 'package:flutter_riverpod/legacy.dart';
import 'package:shop_ledger/data/repositories/auth_repository.dart';
import 'package:shop_ledger/features/auth/login/view_model/login_state.dart';
import 'package:shop_ledger/models/auth/login_request.dart';

import '../../sign_up/view_model/sign_up_provider.dart';

class LoginViewModel  extends StateNotifier<LoginState>{
  final AuthRepository repository;
  LoginViewModel(this.repository) : super(LoginState());

  Future<void> login(String email, String password)async{
    state = state.copyWith(isLoading: true, error: null);
    try{
      final request = LoginRequest(email: email.trim(), password: password);
      final response = await repository.login(request);

      if(response.isSuccess){
        state = state.copyWith(isLoading: false, isSuccess: true);
      }
      else{
        state = state.copyWith(isLoading: false, error: response.errorMessage ?? "Login Field");
      }
    }
    catch(e){
       state = state.copyWith(isLoading: false, error: "Network error: ${e.toString()}");
    }
  }
}


final loginViewModelProvider = StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LoginViewModel(repository);
});