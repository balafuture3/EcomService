import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/repo/forgotpassrepo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../network/api_error.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';

class ForgotpasswordBloc extends Bloc<ForgotpasswordEvent, ForgotpasswordState> {
  final ForgotPassRepository repository;
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ForgotpasswordBloc(this.repository) : super(ForgotpasswordInitial()) {
    on<MobileNumberChangeEvent>(MobileNumberChange);
    on<ForgotPassSubmit>(ForgotSubmit);
    on<PasswordChangeEvent>(PasswordChange);
    on<ConfirmPasswordChangeEvent>(ConfirmPasswordChange);
    on<EmailChangeEvent>(EmailChangeChange);
    on<ForgotpasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  FutureOr<void> MobileNumberChange(
      MobileNumberChangeEvent event, Emitter<ForgotpasswordState> emit) {
    final mobilenumber = event.mobilenumber.toUpperCase();
    final mobileNumberError = mobileValidate(mobilenumber);
    emit(state.copyWith(
        mobilenumber: mobilenumber, mobilenumberError: mobileNumberError));
  }

  FutureOr<void> PasswordChange(
      PasswordChangeEvent event, Emitter<ForgotpasswordState> emit) {
    final password = event.password;
    String? error = passwordValidate(password);
    emit(state.copyWith(password: password, passwordError: error));
  }

  FutureOr<void> ConfirmPasswordChange(
      ConfirmPasswordChangeEvent event, Emitter<ForgotpasswordState> emit) {
    final password = event.password;
    String? error = confirmpasswordValidate(password);
    emit(
        state.copyWith(confirmpassword: password, confirmpasswordError: error));
  }

  FutureOr<void> EmailChangeChange(
      EmailChangeEvent event, Emitter<ForgotpasswordState> emit) {
    final email = event.email;
    final emailError = emailValidate(email);
    emit(state.copyWith(email: email, emailError: emailError));
  }

  Future<FutureOr<void>> ForgotSubmit(
      ForgotPassSubmit event, Emitter<ForgotpasswordState> emit) async {
    if (state.mobilenumberError == "" &&
        state.passwordError == "" &&
        state.emailError == "" &&
        passwordController.text.isNotEmpty &&
        confirmpasswordController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty ) {
      emit(ForgotLoading());
      ApiResponse apiSiteResponse = await repository.Forgotpasscall(emailController.text,  mobileNumberController.text, passwordController.text);
      if (apiSiteResponse.data != null) {
        emit(ForgotSuccess());
      } else {
        emit(ForgotFailed(apiSiteResponse.message!));
      }
    } else {
      final mobileNumberError = mobileValidate(mobileNumberController.text);
      emit(state.copyWith(
          mobilenumber: mobileNumberController.text,
          mobilenumberError: mobileNumberError));
      String? error = passwordValidate(passwordController.text);
      emit(state.copyWith(password: passwordController.text, passwordError: error));
      final emailError = emailValidate(emailController.text);
      emit(state.copyWith(email: emailController.text, emailError: emailError));
      String? confirmerror = confirmpasswordValidate(confirmpasswordController.text);
      emit(
          state.copyWith(confirmpassword: confirmpasswordController.text, confirmpasswordError: confirmerror));
    }
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

  String usernameValidate(username) {
    return username.isEmpty
        ? 'Name is required'
        : username.toString().length < 4
        ? 'Name should be greater than 4 characters'
        : '';
  }

  String passwordValidate(password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!containsCapitalLetter(password)) {
      return 'Password must contain at least one capital letter';
    } else if (!containsLowerCaseLetter(password)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!containsNumber(password)) {
      return 'Password must contain at least one number';
    } else if (!containsSpecialCharacter(password)) {
      return 'Password must contain at least one special character';
    } else {
      return '';
    }
  }

  String confirmpasswordValidate(password) {
    if (password != passwordController.text) {
      return 'Password and Confirm Password should be same';
    } else {
      return '';
    }
  }

  String emailValidate(String email) {
    final specialCharacters = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(specialCharacters);
    return email.isEmpty
        ? 'Email is required'
        : !regex.hasMatch(email)
        ? 'Email is invalid'
        : '';
  }

  String addressValidate(String address) {
    final specialCharacters = r'[!@#$%^&*(),.?":{}|<>]';
    final regex = RegExp(specialCharacters);
    return address.isEmpty
        ? 'Address is required'
        : regex.hasMatch(address)
        ? 'Address should not contain special characters'
        : '';
  }

  String mobileValidate(mobilenumber) {
    return mobilenumber.isEmpty
        ? 'Mobile Number is required'
        : mobilenumber.toString().length != 10
        ? 'Mobile Number must be 10 characters'
        : '';
  }

}
