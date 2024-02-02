part of 'signup_bloc.dart';

class SignupState extends Equatable{
  final String username;
  final String password;
  final String confirmpassword;
  final String mobilenumber;
  final String email;
  final String address;
  final String usernameError;
  final String passwordError;
  final String confirmpasswordError;
  final String mobilenumberError;
  final String emailError;
  final String addressrError;
  final String error;
  SignupState({
    this.username="",
    this.password="",
    this.confirmpassword="",
    this.mobilenumber="",
    this.email="",
    this.address="",
    this.mobilenumberError="",
    this.emailError="",
    this.addressrError="",
    this.passwordError="",
    this.confirmpasswordError="",
    this.usernameError="",
    this.error=""});
  SignupState copyWith({String? username,
    String? password,
    String? confirmpassword,
    String? mobilenumber,
    String? email,
    String? address,
    String? usernameError,
    String? passwordError,
    String? confirmpasswordError,
    String? mobilenumberError,
    String? emailError,
    String? addressrError,
    String? error
  }
) {
return SignupState(username:username??this.username, password:password??this.password, confirmpassword:confirmpassword??this.confirmpassword,passwordError:passwordError??this.passwordError,confirmpasswordError: confirmpasswordError??this.confirmpasswordError, usernameError:usernameError??this.usernameError, error:error??this.error, mobilenumber:mobilenumber??this.mobilenumber, email:email??this.email, address:address??this.address, mobilenumberError:mobilenumberError??this.mobilenumberError, emailError:emailError??this.emailError, addressrError:addressrError??this.addressrError);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [username,password,confirmpassword,mobilenumber,email,address,usernameError,passwordError,confirmpasswordError,mobilenumberError,emailError,addressrError,error];
}
class SignupLoading extends SignupState
{
}
class SignupSuccess extends SignupState
{
  final SuccessResponse response;
  SignupSuccess(this.response);

}
class SignupFailed extends SignupState
{
  final String message;
  SignupFailed(this.message);
}


