part of 'forgotpassword_bloc.dart';

@immutable
abstract class ForgotpasswordEvent {}

class ForgotPassSubmit extends ForgotpasswordEvent
{

}
class MobileNumberChangeEvent extends ForgotpasswordEvent
{
  final mobilenumber;
  MobileNumberChangeEvent(this.mobilenumber);
  @override
  List<Object?> get props => [mobilenumber];
}
class PasswordChangeEvent extends ForgotpasswordEvent
{
  final password;
  PasswordChangeEvent(this.password);
  @override
  List<Object?> get props => [password];

}
class ConfirmPasswordChangeEvent extends ForgotpasswordEvent
{
  final password;
  ConfirmPasswordChangeEvent(this.password);
  @override
  List<Object?> get props => [password];

}

class EmailChangeEvent extends ForgotpasswordEvent
{
  final email;
  EmailChangeEvent(this.email);
  @override
  List<Object?> get props => [email];

}


