part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final String username;
  final String password;
  final String passwordError;
  final String usernameError;
  final String error;

  const LoginState({
    this.username = "",
    this.password = "",
    this.passwordError = "",
    this.usernameError = "",
    this.error = "",
  });

  LoginState copyWith({
    String? username,
    String? password,
    String? passwordError,
    String? usernameError,
    String? error,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      usernameError: usernameError ?? this.usernameError,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props =>
      [username, password, usernameError, passwordError, error];
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse data;
  LoginSuccess(this.data);
  @override
  List<Object> get props => [data];
}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed(this.message);

  @override
  List<Object> get props => [message];
}
