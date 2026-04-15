import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_ledger/core/network/api_client.dart';
import 'package:shop_ledger/core/network/api_endpoints.dart';
import 'package:shop_ledger/models/auth/sign_up_request.dart';
import 'package:shop_ledger/models/response_model.dart';
import '../sources/local/shared_preference/shared_preference_data.dart';

class AuthRemoteService {
  final ApiClient apiClient;

  AuthRemoteService({required this.apiClient});

  SharedPreferenceData sharedPreferencesData = SharedPreferenceData();

  Future<ResponseModel> signUp(SignUpRequest request)async{
    try{
      final response = await apiClient.postRequest(
          endpoints: ApiEndpoints.signUp,
          body: request.toJson()
      );
      if(response['status']==true){
        return ResponseModel(
          isSuccess: true,
          data: response['data'],
        );
      }
      else{
        return ResponseModel(
          isSuccess: false,
          errorMessage: response['message'],
        );
      }
    }
    catch(e){
      return ResponseModel(
        isSuccess: false,
        errorMessage: e.toString()
      );
    }
  }
}