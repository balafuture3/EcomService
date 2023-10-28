part of 'login_bloc.dart';

class LoginState {

  late final FormSubmissionStatus formstatus;
  late final String Username;
  late final String Password;
  // bool get isValidUsername => Username.length>3;
  // bool get isValidPassword=> Password.length>3;

  LoginState({required this.Username,required this.Password,this.formstatus=const InitForm()});
  LoginState copyWith({String username='',String password='', FormSubmissionStatus formSubmissionStatus = const InitForm(),})
{
  return LoginState(formstatus: formSubmissionStatus, Username: username!=""?username:Username, Password: password!=""?password:Password);
}
}
