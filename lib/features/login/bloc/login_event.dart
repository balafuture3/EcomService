part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// Event for changing the username
class UsernameChangeEvent extends LoginEvent {
  const UsernameChangeEvent(this.username);
  final String username;

  @override
  List<Object> get props => [username];
}

// Event for changing the password
class PasswordChangeEvent extends LoginEvent {
  const PasswordChangeEvent(this.password);
  final String password;

  @override
  List<Object> get props => [password];
}

// Event for submitting the login credentials
class LoginSubmitted extends LoginEvent {
  const LoginSubmitted(this.username, this.password);
  final String username, password;
  @override
  List<Object> get props => [username, password];
}
