abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  final String message;
  LoginSuccess({required this.token, required this.message});
}

class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure(this.errMessage);
}
