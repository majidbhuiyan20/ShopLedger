import 'package:shop_ledger/data/remote/auth_remote_service.dart';
import 'package:shop_ledger/models/auth/sign_up_request.dart';

import '../../models/response_model.dart';

class AuthRepository {
  final AuthRemoteService remoteService;
  AuthRepository({required this.remoteService});

  Future<ResponseModel> signUp(SignUpRequest request)async {
    return await remoteService.signUp(request);
  }
}