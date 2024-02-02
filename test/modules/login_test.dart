import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:ecomservice/model/LoginResponse.dart';
import 'package:ecomservice/features/login/bloc/login_bloc.dart';
import 'package:ecomservice/network/dio_helper.dart';
import 'package:ecomservice/network/urlConstants.dart';
import 'package:ecomservice/repo/loginrepo.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Login Test',(){
    late LoginBloc loginBloc;
    late LoginRepository loginRepository;
    late Dio? dio;
    late DioAdapter dioAdapter;
//common setup for dio
    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio!);
      dio?.httpClientAdapter = dioAdapter;
    });


    blocTest<LoginBloc, LoginState>(
      'Success',
      setUp: ((){
        Map response = {
          "status": true,
          "message": "Success",
          "data": {
            "id": 10000,
            "name": "balatest",
            "email": "bala.future3@gmail.com",
            "mobileNumber": "7418230370",
            "categoryId": 1,
            "password": "Password@123",
            "address": "ZaminMuthur",
            "latitude": "10.67521200",
            "longitude": "76.96882200",
            "profilePhoto": "uploads/biriyani.jpg",
            "firebaseId": "1213",
            "createdBy": 10000,
            "createdOn": "2023-10-28T01:38:38.000Z",
            "updatedBy": 10000,
            "updatedOn": "2023-12-26T04:22:13.000Z",
            "deleteFlag": 0
          }
        };
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(200, response),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),
        LoginSuccess(LoginResponse.fromJson(
            {
              "status": true,
              "message": "Success",
              "data": {
                "id": 10000,
                "name": "balatest",
                "email": "bala.future3@gmail.com",
                "mobileNumber": "7418230370",
                "categoryId": 1,
                "password": "Password@123",
                "address": "ZaminMuthur",
                "latitude": "10.67521200",
                "longitude": "76.96882200",
                "profilePhoto": "uploads/biriyani.jpg",
                "firebaseId": "1213",
                "createdBy": 10000,
                "createdOn": "2023-10-28T01:38:38.000Z",
                "updatedBy": 10000,
                "updatedOn": "2023-12-26T04:22:13.000Z",
                "deleteFlag": 0
              }
            }
        ))
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Unauthorized User Login',
      setUp: ((){
        Map response = {
          "status": false,
          "message": "Unauthorized",
          "data": null
        };
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(200, response),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),
        LoginFailed("Unauthorized")
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Not Found',
      setUp: ((){
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(404, ""),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),LoginFailed("Not found")
      ],
    );
    blocTest<LoginBloc, LoginState>(
      Strings.unauthorized,
      setUp: ((){
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(401, ""),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),LoginFailed(Strings.unauthorized)
      ],
    );
    blocTest<LoginBloc, LoginState>(
      Strings.forbidden,
      setUp: ((){
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(403, ""),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),LoginFailed(Strings.forbidden)
      ],
    );
    blocTest<LoginBloc, LoginState>(
      Strings.tooManyRequest,
      setUp: ((){
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(429, ""),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),LoginFailed(Strings.tooManyRequest)
      ],
    );
    blocTest<LoginBloc, LoginState>(
      Strings.serverError,
      setUp: ((){
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(500, ""),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),LoginFailed(Strings.serverError)
      ],
    );
    blocTest<LoginBloc, LoginState>(
      Strings.serverError,
      setUp: ((){
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(500, ""),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),LoginFailed(Strings.serverError)
      ],
    );
    blocTest<LoginBloc, LoginState>(
      Strings.methodNotAllowed,
      setUp: ((){
        Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
        dioAdapter.onPost(UrlConstants.loginUrl, (server) => server.reply(405, ""),data: data);
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("7418230370", "Password@123")),
      wait: Duration(seconds: 1),
      expect: () => [
        LoginLoading(),LoginFailed(Strings.methodNotAllowed)
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'Username validation on submit',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted("", "")),
      expect: () => [
        LoginState(usernameError: "Employee ID is required"),
        LoginState(
          usernameError: "Employee ID is required",
          passwordError: "Password is required",
        )
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Invalid username format on submit',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) {
        loginBloc.emit(LoginState().copyWith(usernameError: "123"));
        loginBloc.add(LoginSubmitted("11234", "password"));
      },
      expect: () => [
        LoginState(usernameError: "123"),
        LoginState(
            usernameError:
                "Invalid username format. Should be greater than 4 characters"),
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Password validation on submit',
      build: () => loginBloc,
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      act: (bloc) {
        loginBloc.emit(LoginState().copyWith(passwordError: "123"));
        loginBloc.add(LoginSubmitted("11234", "password"));
      },
      expect: () => [
        LoginState(passwordError: "123"),
        LoginState(
            passwordError:
                'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character'),
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Username validation',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(UsernameChangeEvent("")),
      expect: () => [LoginState(usernameError: "Employee ID is required")],
    );
    blocTest<LoginBloc, LoginState>(
      'Username validation',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(UsernameChangeEvent("1234")),
      expect: () => [
        LoginState(
            username: "1234",
            usernameError: 'Username should be greater than 4 characters')
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Password validation',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(PasswordChangeEvent("")),
      expect: () => [LoginState(passwordError: "Password is required")],
    );
    blocTest<LoginBloc, LoginState>(
      'Password validation',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(PasswordChangeEvent("Passwor")),
      expect: () => [
        LoginState(
            password: "Passwor",
            passwordError: "Password must be at least 8 characters")
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Password validation',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(PasswordChangeEvent("password")),
      expect: () => [
        LoginState(
            password: "password",
            passwordError: "Password must contain at least one capital letter")
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Password validation',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(PasswordChangeEvent("PASSWORD")),
      expect: () => [
        LoginState(
            password: "PASSWORD",
            passwordError:
                "Password must contain at least one lowercase letter")
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Password validation',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(PasswordChangeEvent("Password")),
      expect: () => [
        LoginState(
            password: "Password",
            passwordError: "Password must contain at least one number")
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'Password validation',
      setUp: ((){
        EquatableConfig.stringify = true;
        loginRepository = LoginRepository(dio!);
        loginBloc = LoginBloc(loginRepository);
      }),
      build: () => loginBloc,
      act: (bloc) => bloc.add(PasswordChangeEvent("Password1")),
      expect: () => [
        LoginState(
            password: "Password1",
            passwordError:
                "Password must contain at least one special character")
      ],
    );
    test("validate user", () {
      expect(loginBloc.isValidUsernameFormat("username"), true);
    });
    test("LoginSubmit props", () {
      expect(LoginSubmitted("username", "password").props,
          ["username", "password"]);
    });
    test("UsernameChange props", () {
      expect(UsernameChangeEvent("username").props, ["username"]);
    });
    test("PasswordChange props", () {
      expect(PasswordChangeEvent("username").props, ["username"]);
    });
    test("PasswordChange props", () {
      expect(LoginEvent().props, []);
    });
    // tearDown(() {
    //   loginBloc.close();
    // });
  });
}
