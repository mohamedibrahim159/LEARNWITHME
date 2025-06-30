import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnwithme/auth/data/models/reset_password.dart';
import 'package:learnwithme/auth/data/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;

  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());
    try {
      var response = await authRepo.resetPassword(
        ResetPasswordRequest(
          email: email,
          otpCode: otp,
          newPassword: newPassword,
          confirmPassword: newPassword,
        ),
      );
      emit(ResetPasswordSuccess(response.message));
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }
}
