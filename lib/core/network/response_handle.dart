import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ResponseHandle {
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

  static dynamic handleResponse(Response response) {
    final statusCode = response.statusCode;
    final data = response.data;

    if (statusCode == 200 || statusCode == 201) {
      _logger.i('✔ Response [$statusCode]: $data');
      return data;
    } else if (statusCode == 204) {
      _logger.i('✔ Response [204]: No Content');
      return null;
    } else if (statusCode == 400) {
      _logger.w('⚠ Bad Request [400]: $data');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Bad Request: $data',
      );
    } else if (statusCode == 401) {
      _logger.w('⚠ Unauthorized [401]: $data');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Unauthorized. Please login again.',
      );
    } else if (statusCode == 403) {
      _logger.w('⚠ Forbidden [403]: $data');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Forbidden: You do not have permission.',
      );
    } else if (statusCode == 404) {
      _logger.w('⚠ Not Found [404]: $data');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Resource not found.',
      );
    } else if (statusCode == 422) {
      _logger.w('⚠ Unprocessable Entity [422]: $data');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Validation error: $data',
      );
    } else if (statusCode != null && statusCode >= 500) {
      _logger.e('✘ Server Error [$statusCode]: $data');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Server error. Please try again later.',
      );
    } else {
      _logger.e('✘ Unexpected Response [$statusCode]: $data');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Unexpected error: $statusCode',
      );
    }
  }
}