import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_ledger/core/network/api_client.dart';
import 'package:shop_ledger/core/network/api_endpoints.dart';
import 'package:shop_ledger/models/auth/login_request.dart';
import 'package:shop_ledger/models/auth/otp_request.dart';
import 'package:shop_ledger/models/auth/resend_otp_request.dart';
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

  Future<ResponseModel> login(LoginRequest request)async {
    try{
      final response =  await apiClient.postRequest(
          endpoints: ApiEndpoints.logIn,
          body: request.toJson(),
      );
      if (response['status'] == true){
        final token = response['data']['access_token'];
        if(token != null){
          await SharedPreferenceData.setToken(token);
        }
        return ResponseModel(isSuccess: true, data: response['data']);
      }
      else{
        return ResponseModel(isSuccess: false, errorMessage: response['message']);
      }
    }
    catch(e){
         return ResponseModel(
            isSuccess: false,
            errorMessage: "Login Failed: ${e.toString()}"
          );
    }
  }
  Future<ResponseModel> verifyOtp(OtpRequest request)async{
    try{
      final response = await apiClient.postRequest(
          endpoints: ApiEndpoints.verifyOtp,
        body: request.toJson(),
      );
      if(response['status'] == true){
        return ResponseModel(isSuccess: true, data: response['data']);

      }
      else{
        return ResponseModel(isSuccess: false, errorMessage: response['message']);
      }
    }
    catch(e){
      return ResponseModel(
        isSuccess: false,
        errorMessage: e.toString()
      );
      }
    }
  Future<ResponseModel> resendOtp(ResendOtpRequest request)async{
    try{
      final response = await apiClient.postRequest(
          endpoints: ApiEndpoints.resendOtp,
        body: request.toJson(),
      );
      if(response['status'] == true){
        return ResponseModel(isSuccess: true, data: response['data']);

      }
      else{
        return ResponseModel(isSuccess: false, errorMessage: response['message']);
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