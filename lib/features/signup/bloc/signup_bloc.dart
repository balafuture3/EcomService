import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/model/SucessResponse.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../../../network/api_error.dart';
import '../../../repo/signuprepo.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  late SignupRepository repository;
  late Position position;

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  SignupBloc(this.repository) : super(SignupState()) {

    on<SignupInit>(SignupInitialize);
    on<UsernameChangeEvent>(UsernameChange);
    on<MobileNumberChangeEvent>(MobileNumberChange);
    on<SignupSubmitEvent>(SignupSubmit);
    on<PasswordChangeEvent>(PasswordChange);
    on<ConfirmPasswordChangeEvent>(ConfirmPasswordChange);
    on<EmailChangeEvent>(EmailChangeChange);
    on<AddressChangeEvent>(AddressChangeChange);

  }

  Future<FutureOr<void>> SignupInitialize(
      SignupInit event, Emitter<SignupState> emit) async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  FutureOr<void> UsernameChange(
      UsernameChangeEvent event, Emitter<SignupState> emit) {
    final username = event.username.toUpperCase();
    final usernameError = usernameValidate(username);
    emit(state.copyWith(username: username, usernameError: usernameError));
  }

  FutureOr<void> MobileNumberChange(
      MobileNumberChangeEvent event, Emitter<SignupState> emit) {
    final mobilenumber = event.mobilenumber.toUpperCase();
    final mobileNumberError = mobileValidate(mobilenumber);
    emit(state.copyWith(
        mobilenumber: mobilenumber, mobilenumberError: mobileNumberError));
  }

  FutureOr<void> PasswordChange(
      PasswordChangeEvent event, Emitter<SignupState> emit) {
    final password = event.password;
    String? error = passwordValidate(password);
    emit(state.copyWith(password: password, passwordError: error));
  }

  FutureOr<void> ConfirmPasswordChange(
      ConfirmPasswordChangeEvent event, Emitter<SignupState> emit) {
    final password = event.password;
    String? error = confirmpasswordValidate(password);
    emit(
        state.copyWith(confirmpassword: password, confirmpasswordError: error));
  }

  FutureOr<void> EmailChangeChange(
      EmailChangeEvent event, Emitter<SignupState> emit) {
    final email = event.email;
    final emailError = emailValidate(email);
    emit(state.copyWith(email: email, emailError: emailError));
  }

  FutureOr<void> AddressChangeChange(
      AddressChangeEvent event, Emitter<SignupState> emit) {
    final address = event.address;
    final addressError = addressValidate(address);
    emit(state.copyWith(address: address, addressrError: addressError));
  }

  Future<FutureOr<void>> SignupSubmit(
      SignupSubmitEvent event, Emitter<SignupState> emit) async {
    if (state.mobilenumberError == "" &&
        state.usernameError == "" &&
        state.addressrError == "" &&
        state.passwordError == "" &&
        state.emailError == "" &&
        nameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmpasswordController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        addressController.text.isNotEmpty) {
      emit(SignupLoading());
      ApiResponse apiSiteResponse = await repository.Signupcall(
          nameController.text,
          emailController.text,
          mobileNumberController.text,
          passwordController.text,
          addressController.text,
          position.latitude,
          position.longitude);
      if (apiSiteResponse.data != null) {
        emit(SignupSuccess(apiSiteResponse.data));
      } else {
        emit(SignupFailed(apiSiteResponse.message!));
      }
    } else {
      final usernameError = usernameValidate(nameController.text);
      emit(state.copyWith(
          username: nameController.text, usernameError: usernameError));
      final mobileNumberError = mobileValidate(mobileNumberController.text);
      emit(state.copyWith(
          mobilenumber: mobileNumberController.text,
          mobilenumberError: mobileNumberError));
      String? error = passwordValidate(passwordController.text);
      emit(state.copyWith(password: passwordController.text, passwordError: error));
      final emailError = emailValidate(emailController.text);
      emit(state.copyWith(email: emailController.text, emailError: emailError));
      final addressError = addressValidate(addressController.text);
      emit(state.copyWith(address: addressController.text, addressrError: addressError));
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
