part of 'forgotpassword_bloc.dart';

class ForgotpasswordState extends Equatable {
  final String password;
  final String confirmpassword;
  final String mobilenumber;
  final String email;
  final String passwordError;
  final String confirmpasswordError;
  final String mobilenumberError;
  final String emailError;
  final String error;

  ForgotpasswordState({
    this.password = "",
    this.confirmpassword = "",
    this.mobilenumber = "",
    this.email = "",
    this.mobilenumberError = "",
    this.emailError = "",
    this.passwordError = "",
    this.confirmpasswordError = "",
    this.error = ""});

  ForgotpasswordState copyWith({String? username,
    String? password,
    String? confirmpassword,
    String? mobilenumber,
    String? email,
    String? passwordError,
    String? confirmpasswordError,
    String? mobilenumberError,
    String? emailError,
    String? error
  }) {
    return ForgotpasswordState(
        password: password ?? this.password,
        confirmpassword: confirmpassword ?? this.confirmpassword,
        passwordError: passwordError ?? this.passwordError,
        confirmpasswordError: confirmpasswordError ?? this.confirmpasswordError,
        error: error ?? this.error,
        mobilenumber: mobilenumber ?? this.mobilenumber,
        email: email ?? this.email,
        mobilenumberError: mobilenumberError ?? this.mobilenumberError,
        emailError: emailError ?? this.emailError);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [password,confirmpassword,mobilenumber,email,passwordError,confirmpasswordError,mobilenumberError,emailError,error];


}


class ForgotpasswordInitial extends ForgotpasswordState {}
class ForgotLoading extends ForgotpasswordState{}
class ForgotSuccess extends ForgotpasswordState{}
class ForgotFailed extends ForgotpasswordState{
  final String message;
  ForgotFailed(this.message);
  List<Object?> get props => [message];
}





