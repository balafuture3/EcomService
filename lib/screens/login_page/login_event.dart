part of 'login_bloc.dart';

@immutable
abstract class InitPageEvent {

}
class InitEvent extends InitPageEvent{}
class LoginSubmitEvent extends InitPageEvent{
  final String username;
  final String Password;
  LoginSubmitEvent({required this.username,required this.Password
});
}
class TextChangeEvent extends InitPageEvent{
  final String username;
  final String password;
  TextChangeEvent({required this.username, required this.password});
}
// class PasswordChangeEvent extends InitPageEvent{
//   final String Password;
//   PasswordChangeEvent({required this.Password});
// }

