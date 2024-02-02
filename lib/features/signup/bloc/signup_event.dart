part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {


}
class SignupInit extends SignupEvent
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class UsernameChangeEvent extends SignupEvent
{
  final username;
  UsernameChangeEvent(this.username);
  @override
  List<Object?> get props => [username];

}
class MobileNumberChangeEvent extends SignupEvent
{
  final mobilenumber;
  MobileNumberChangeEvent(this.mobilenumber);
  @override
  List<Object?> get props => [mobilenumber];
}
class PasswordChangeEvent extends SignupEvent
{
  final password;
  PasswordChangeEvent(this.password);
  @override
  List<Object?> get props => [password];

}
class ConfirmPasswordChangeEvent extends SignupEvent
{
  final password;
  ConfirmPasswordChangeEvent(this.password);
  @override
  List<Object?> get props => [password];

}

class EmailChangeEvent extends SignupEvent
{
  final email;
  EmailChangeEvent(this.email);
  @override
  List<Object?> get props => [email];

}

class AddressChangeEvent extends SignupEvent
{
  final address;
  AddressChangeEvent(this.address);
  @override
  List<Object?> get props => [address];

}
class SignupSubmitEvent extends SignupEvent
{
  // final username;
  // final address;
  // final password;
  // final email;
  // final mobile;
  // SignupSubmitEvent(this.username,this.password,this.email,this.address,this.mobile);
  @override
  List<Object?> get props => [
    // address,username,password,email,mobile
  ];

}

