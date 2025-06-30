import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnwithme/auth/data/models/register_model.dart';
import 'package:learnwithme/auth/data/repos/auth_repo.dart';
import 'package:learnwithme/services/api_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;

  RegisterCubit(this.authRepo) : super(RegisterInitial());

  Future<void> registerUser(RegisterRequest request) async {
    emit(RegisterLoading());

    try {
      final ApiResponse response = await authRepo.register(request);

      if (response.success) {
        emit(RegisterSuccess(response.message));
      } else {
        emit(RegisterFailure(response.message));
      }
    } catch (e) {
      emit(RegisterFailure('Unexpected error: $e'));
    }
  }
}
