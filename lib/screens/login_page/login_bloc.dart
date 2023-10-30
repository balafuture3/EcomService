import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecomservice/model/LoginModel.dart';

import '../../repo/repository.dart';
import 'FormSubmissionStatus.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<InitPageEvent, LoginState> {
  late  final  ApiProvider apiProvider;
  late final BuildContext context;
  LoginBloc(this.apiProvider, this.context) : super(LoginState(Username: '',Password: '')) {
    on<InitPageEvent>((event, emit) { });
    on<TextChangeEvent>((event, emit) { _TextChanged(event,emit);});
    // on<PasswordChangeEvent>((event, emit) {_PasswordChanged(event,emit); });

    on<LoginSubmitEvent>((event,emit)
    async {
      await _langChange();
    await  _onSubmit(event, emit);
    });
  }
_langChange()
{
  
}
  Future<FutureOr<void>> _onSubmit(LoginSubmitEvent event, Emitter<LoginState> emit)
  async {

   emit(state.copyWith(formSubmissionStatus: ProcessForm()));
    await apiProvider.LoginAPI(event.username,event.Password ).then((value)
  async  {
      if(value.statusCode == 200)
        {
          LoginModel liLogin = LoginModel.fromJson(jsonDecode(value.data));
          // print(liLogin.location);
          if(liLogin.status==true) {
            emit(state.copyWith(formSubmissionStatus:  LoginSuccess()));
          }
          else {
            emit(state.copyWith(formSubmissionStatus:  LoginFailed(liLogin.message.toString())));
          }
        }

      else
        {
          emit(state.copyWith(formSubmissionStatus: LoginFailed("Error")));
        }

    });
    
 
  }
  FutureOr<void> _TextChanged(TextChangeEvent event, Emitter<LoginState> emit)
  {
    if(event.username.isNotEmpty && event.password.length>5) {
      emit(state.copyWith(formSubmissionStatus: FormValidated()));
    }
    else
      {
        if(event.username.isEmpty&&event.password.isEmpty) {
        emit(state.copyWith(formSubmissionStatus: TextError(usernameError: "Username is empty",passwordError: "Password is Empty")));
      }
        else if(event.password.length<6&&event.password.isNotEmpty) {
        emit(state.copyWith(formSubmissionStatus: TextError(passwordError: "Password must be 6 characters",usernameError: "")));
      }
        else if(event.username.isEmpty) {
          emit(state.copyWith(formSubmissionStatus: TextError(usernameError: "Username is empty",passwordError: "")));
        }
        else if(event.password.isEmpty) {
          emit(state.copyWith(formSubmissionStatus: TextError(passwordError: "Password is empty",usernameError: "")));
        }
      else {
        emit(state.copyWith(username: event.username,password: event.password));
      }
      }
  }
  // FutureOr<void> _PasswordChanged(PasswordChangeEvent event, Emitter<LoginState> emit)
  // {
  //   emit(state.copyWith(password: event.Password));
  // }
}
