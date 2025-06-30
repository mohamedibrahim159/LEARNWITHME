import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnwithme/auth/data/models/forgot_password.dart';
import 'package:learnwithme/auth/data/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo authRepo;

  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitial());

  Future<void> sendForgotPasswordEmail(String email) async {
    emit(ForgotPasswordLoading());

    try {
      final response = await authRepo.forgotPassword(
        ForgotPasswordRequest(email: email),
      );

      if (response.success) {
        emit(ForgotPasswordSuccess(response.message));
      } else {
        emit(ForgotPasswordFailure(response.message));
      }
    } catch (e) {
      emit(ForgotPasswordFailure('Unexpected error: $e'));
    }
  }
}
