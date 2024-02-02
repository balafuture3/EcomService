import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecomservice/model/LoginResponse.dart';
import 'package:ecomservice/network/api_error.dart';
import 'package:equatable/equatable.dart';

import '../../../repo/loginrepo.dart';
import '../../../values/strings.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginState()) {
    on<UsernameChangeEvent>(onUsernameChangedEvent);
    on<PasswordChangeEvent>(onPasswordChangedEvent);
    on<LoginSubmitted>(onSubmitted);
  }

  void onUsernameChangedEvent(
      UsernameChangeEvent event, Emitter<LoginState> emit) {
    final username = event.username.toUpperCase();
    final usernameError = username.isEmpty
        ? 'Mobile number is  required'
        : username.length !=10
            ? 'Mobile number must be 10 digits'
            : '';

    emit(state.copyWith(username: username, usernameError: usernameError));
  }

  void onPasswordChangedEvent(
      PasswordChangeEvent event, Emitter<LoginState> emit) {
    final password = event.password;
    String? error = state.passwordError;

    if (password.isEmpty) {
      error = 'Password is required';
    } else if (password.length < 8) {
      error = 'Password must be at least 8 characters';
    } else if (!containsCapitalLetter(password)) {
      error = 'Password must contain at least one capital letter';
    } else if (!containsLowerCaseLetter(password)) {
      error = 'Password must contain at least one lowercase letter';
    } else if (!containsNumber(password)) {
      error = 'Password must contain at least one number';
    } else if (!containsSpecialCharacter(password)) {
      error = 'Password must contain at least one special character';
    } else {
      error = '';
    }
    emit(state.copyWith(password: password, passwordError: error));
  }

  void onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final username = event.username;
    final password = event.password;
    if (username.isEmpty ||
        password.isEmpty ||
        state.usernameError.isNotEmpty ||
        state.passwordError.isNotEmpty) {
      if (username.isEmpty) {
        emit(state.copyWith(usernameError: "Employee ID is required"));
      } else if (state.usernameError.isNotEmpty && username.isNotEmpty) {
        emit(state.copyWith(
            usernameError:
                "Invalid username format. Should be greater than 4 characters"));
      }

      if (password.isEmpty) {
        emit(state.copyWith(passwordError: "Password is required"));
      } else if (state.passwordError.isNotEmpty && password.isNotEmpty) {
        emit(state.copyWith(
            passwordError:
                'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character'));
      }
    } else if (state.usernameError.isEmpty && state.passwordError.isEmpty) {
      // try {
      emit(LoginLoading());
      ApiResponse apiSiteResponse =
          await loginRepository.LoginAPI(username, password);
      if (apiSiteResponse.data != null) {
        Strings.userid=apiSiteResponse.data.data.id.toString();
        Strings.loginname=apiSiteResponse.data.data.name.toString();
        Strings.loginemail=apiSiteResponse.data.data.email.toString();
        Strings.profilephoto=apiSiteResponse.data.data.profilePhoto.toString();
        emit(LoginSuccess(apiSiteResponse.data));
      } else {
        emit(LoginFailed(apiSiteResponse.message!));
      }
    }
  }

  bool isValidUsernameFormat(String username) {
    // final regex = RegExp(r'^VVDN/\d+$');
    // return regex.hasMatch(username);
    return username.length > 4;
  }

  bool containsSpecialCharacter(String password) {
    final specialCharacters = r'[!@#$%^&*(),.?":{}|<>]';
    final regex = RegExp(specialCharacters);
    return regex.hasMatch(password);
  }

  bool containsNumber(String password) {
    final regex = RegExp(r'[0-9]');
    return regex.hasMatch(password);
  }

  bool containsCapitalLetter(String password) {
    final regex = RegExp(r'[A-Z]');
    return regex.hasMatch(password);
  }

  bool containsLowerCaseLetter(String password) {
    final regex = RegExp(r'[a-z]');
    return regex.hasMatch(password);
  }
}
