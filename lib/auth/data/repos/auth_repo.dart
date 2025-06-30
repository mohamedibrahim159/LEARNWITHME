import 'dart:developer';

import 'package:learnwithme/auth/data/models/forgot_password.dart';
import 'package:learnwithme/auth/data/models/login_model.dart';
import 'package:learnwithme/auth/data/models/register_model.dart';
import 'package:learnwithme/auth/data/models/reset_password.dart';
import 'package:learnwithme/auth/data/services/auth_service.dart';
import 'package:learnwithme/services/api_service.dart';

class AuthRepo {
  final AuthService _authService = AuthService();

  Future<ApiResponse> register(RegisterRequest request) async {
    try {
      return await _authService.register(request);
    } catch (e) {
      log('❌ Error in AuthRepository.register: $e');
      return ApiResponse(
        status: 500,
        success: false,
        message: 'Something went wrong',
        result: null,
      );
    }
  }

  Future<ApiResponse> login(LoginRequest request) async {
    try {
      return await _authService.login(request);
    } catch (e) {
      log('❌ Error in AuthRepository.login: $e');
      return ApiResponse(
        status: 500,
        success: false,
        message: 'Something went wrong',
        result: null,
      );
    }
  }

  Future<ApiResponse> forgotPassword(ForgotPasswordRequest request) async {
    try {
      return await _authService.forgotPassword(request);
    } catch (e) {
      log('❌ Error in AuthRepository.forgotPassword: $e');
      return ApiResponse(
        status: 500,
        success: false,
        message: 'Something went wrong',
        result: null,
      );
    }
  }

  Future<ApiResponse> resetPassword(ResetPasswordRequest request) async {
    try {
      return await _authService.resetPassword(request);
    } catch (e) {
      log('❌ Error in AuthRepository.resetPassword: $e');
      return ApiResponse(
        status: 500,
        success: false,
        message: 'Something went wrong',
        result: null,
      );
    }
  }
}
