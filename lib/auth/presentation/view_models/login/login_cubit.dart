import 'package:learnwithme/auth/data/models/login_model.dart';
import 'package:learnwithme/auth/data/repos/auth_repo.dart';
import 'package:learnwithme/auth/presentation/view_models/login/login_state.dart';
import 'package:learnwithme/services/api_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> loginUser(LoginRequest request) async {
    emit(LoginLoading());

    try {
      final ApiResponse response = await authRepo.login(request);

      if (response.success) {
        emit(LoginSuccess(response.message));
      } else {
        emit(LoginFailure(response.message));
      }
    } catch (e) {
      emit(LoginFailure('Unexpected error: $e'));
    }
  }
}
