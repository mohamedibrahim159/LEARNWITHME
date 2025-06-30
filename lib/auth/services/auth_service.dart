import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:learnwithme/auth/models/forgot_password.dart';
import 'package:learnwithme/auth/models/login_model.dart';
import 'package:learnwithme/auth/models/register_model.dart';
import 'package:learnwithme/auth/models/reset_password.dart';
import 'package:learnwithme/services/api_service.dart';

class AuthService {
  static const String _baseUrl = 'https://hemdanmohamed44.runasp.net/api/Auth';

  Future<ApiResponse> _postRequest(
    String endpoint,
    Map<String, dynamic> body,
    String tag,
  ) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    try {
      log('📤 [$tag] POST: $url');
      log('📤 Body: ${jsonEncode(body)}');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      log('📥 [$tag] Status Code: ${response.statusCode}');
      log('📥 [$tag] Response Body: ${response.body}');

      return ApiResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      log('❌ [$tag] Network error: $e');
      return ApiResponse(
        status: 500,
        success: false,
        message: 'Network error: $e',
        result: null,
      );
    }
  }

  Future<ApiResponse> register(RegisterRequest request) {
    return _postRequest('register', request.toJson(), 'REGISTER');
  }

  Future<ApiResponse> login(LoginRequest request) {
    return _postRequest('login', request.toJson(), 'LOGIN');
  }

  Future<ApiResponse> forgotPassword(ForgotPasswordRequest request) {
    return _postRequest('forgot-password', request.toJson(), 'FORGOT PASSWORD');
  }

  Future<ApiResponse> resetPassword(ResetPasswordRequest request) {
    return _postRequest('reset-password', request.toJson(), 'RESET PASSWORD');
  }
}
