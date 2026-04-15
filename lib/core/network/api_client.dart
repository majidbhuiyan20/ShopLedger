import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shop_ledger/core/network/response_handle.dart';
import '../../data/sources/local/shared_preference/shared_preference_data.dart';
import 'api_endpoints.dart';
import 'error_handle.dart';

class ApiClient {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static Map<String, String>? headers;

  /// Sets the Authorization header.
  /// Prioritizes the passed [token]; falls back to the stored token.
  static Future<void> headerSet(String? token) async {
    final storedToken = await SharedPreferenceData.getToken();

    // Pick the best available token (passed token takes priority)
    final activeToken = token ?? storedToken;

    _logger.i('Setting headers | passed token: ${token != null ? '[present]' : '[null]'} '
        '| stored token: ${storedToken != null ? '[present]' : '[null]'} '
        '| using: ${activeToken != null ? '[active]' : '[none]'}');

    headers = {
      'Content-Type': 'application/json',
      if (activeToken != null) 'Authorization': 'Bearer $activeToken',
    };
  }

  /// GET request
  Future<dynamic> getRequest({
    required String endpoints,
  }) async {
    final url = '${ApiEndpoints.baseUrl}/$endpoints';
    _logger.d('GET ➜ $url');

    try {
      final response = await _dio.get(
        '/$endpoints',
        options: Options(
          headers: headers ?? {'Content-Type': 'application/json'},
        ),
      );
      _logger.i('GET ✔ [$endpoints] status: ${response.statusCode}');
      _logger.d('GET response: ${response.data}');
      return ResponseHandle.handleResponse(response);
    } on DioException catch (e) {
      _logger.e('GET ✘ [$endpoints]', error: e, stackTrace: e.stackTrace);
      ErrorHandle.handleDioError(e);
      rethrow;
    } catch (e, st) {
      _logger.e('GET non-Dio error [$endpoints]', error: e, stackTrace: st);
      rethrow;
    }
  }

  /// POST request
  Future<dynamic> postRequest({
    required String endpoints,
    Map<String, dynamic>? body,
    FormData? formData,
  }) async {
    final url = '${ApiEndpoints.baseUrl}/$endpoints';
    _logger.d('POST ➜ $url');
    _logger.d('POST body: ${body ?? formData?.fields}');

    try {
      final response = await _dio.post(
        '/$endpoints',
        data: body ?? formData,
        options: Options(
          headers: headers ?? {'Content-Type': 'application/json'},
        ),
      );
      _logger.i('POST ✔ [$endpoints] status: ${response.statusCode}');
      _logger.d('POST response: ${response.data}');
      return ResponseHandle.handleResponse(response);
    } on DioException catch (e) {
      _logger.e('POST ✘ [$endpoints]', error: e, stackTrace: e.stackTrace);
      ErrorHandle.handleDioError(e);
      rethrow;
    } catch (e, st) {
      _logger.e('POST non-Dio error [$endpoints]', error: e, stackTrace: st);
      rethrow;
    }
  }

  /// PUT request
  static Future<dynamic> putRequest({
    required String endpoints,
    required Map<String, dynamic> body,
  }) async {
    final url = '${ApiEndpoints.baseUrl}/$endpoints';
    _logger.d('PUT ➜ $url');
    _logger.d('PUT body: $body');

    try {
      final response = await _dio.put(
        '/$endpoints',
        data: body,
        options: Options(
          headers: headers ?? {'Content-Type': 'application/json'},
        ),
      );
      _logger.i('PUT ✔ [$endpoints] status: ${response.statusCode}');
      _logger.d('PUT response: ${response.data}');
      return ResponseHandle.handleResponse(response);
    } on DioException catch (e) {
      _logger.e('PUT ✘ [$endpoints]', error: e, stackTrace: e.stackTrace);
      ErrorHandle.handleDioError(e);
      rethrow;
    } catch (e, st) {
      _logger.e('PUT non-Dio error [$endpoints]', error: e, stackTrace: st);
      rethrow;
    }
  }

  /// PATCH request
  static Future<dynamic> patchRequest({
    required String endpoints,
    Map<String, dynamic>? body,
    FormData? formData,
  }) async {
    // FIX: was building URL as baseUrl + baseUrl + endpoint (double prefix)
    final url = '${ApiEndpoints.baseUrl}/$endpoints';
    _logger.d('PATCH ➜ $url');
    _logger.d('PATCH body: ${body ?? formData?.fields}');

    try {
      final response = await _dio.patch(
        '/$endpoints',                           // use relative path, _dio already has baseUrl
        data: body ?? formData,
        options: Options(
          headers: headers ?? {'Content-Type': 'multipart/form-data'},
        ),
      );
      _logger.i('PATCH ✔ [$endpoints] status: ${response.statusCode}');
      _logger.d('PATCH response: ${response.data}');
      return ResponseHandle.handleResponse(response);
    } on DioException catch (e) {
      _logger.e('PATCH ✘ [$endpoints]', error: e, stackTrace: e.stackTrace);
      ErrorHandle.handleDioError(e);
      rethrow;
    } catch (e, st) {
      _logger.e('PATCH non-Dio error [$endpoints]', error: e, stackTrace: st);
      rethrow;
    }
  }

  /// DELETE request
  static Future<dynamic> deleteRequest({
    required String endpoints,
  }) async {
    final url = '${ApiEndpoints.baseUrl}/$endpoints';
    _logger.d('DELETE ➜ $url');

    try {
      final response = await _dio.delete(
        '/$endpoints',
        options: Options(
          headers: headers ?? {'Content-Type': 'application/json'},
        ),
      );
      _logger.i('DELETE ✔ [$endpoints] status: ${response.statusCode}');
      _logger.d('DELETE response: ${response.data}');
      return ResponseHandle.handleResponse(response);
    } on DioException catch (e) {
      _logger.e('DELETE ✘ [$endpoints]', error: e, stackTrace: e.stackTrace);
      ErrorHandle.handleDioError(e);
      rethrow;
    } catch (e, st) {
      _logger.e('DELETE non-Dio error [$endpoints]', error: e, stackTrace: st);
      rethrow;
    }
  }
}