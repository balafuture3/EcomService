abstract class FormSubmissionStatus
{
  const FormSubmissionStatus();
}
class InitForm extends FormSubmissionStatus
{
const InitForm();
}
class FormValidated extends FormSubmissionStatus
{
}
class TextError extends FormSubmissionStatus
{
  String usernameError;
  String passwordError;
  TextError({required this.usernameError,required this.passwordError});
}

class ProcessForm extends FormSubmissionStatus
{
  
}
class LoginSuccess extends FormSubmissionStatus
{
const LoginSuccess();
}
class LoginFailed extends FormSubmissionStatus
{
  String exception;
  LoginFailed(this.exception);
}