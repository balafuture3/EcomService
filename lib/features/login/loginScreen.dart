import 'package:ecomservice/utils/button.dart';
import 'package:ecomservice/utils/router.dart';
import 'package:ecomservice/utils/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../values/strings.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _employeeNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isAdmin = false;

  Future<bool> _onBackPressed() async {
    bool exit = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text(Strings.loginExitApp),
          content: const Text(Strings.loginAlertDiaTitle),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Dismiss the alert
              },
              child: Text(Strings.no),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Confirm exit
              },
              child: Text(Strings.yes),
            ),
          ],
        );
      },
    );
    return exit ?? false;
  }

  @override
  void initState() {
    Permission.location.request();
    Permission.camera.request();
    super.initState();
    _employeeNumberController.text = '7418230370';
    _passwordController.text = 'Password@123';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                print(state);
                if (state is LoginSuccess) {
                  print(state.data.data?.email);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.dashboard,
                    (route) => false,
                  );
                }
                // if (state is AdminLoginSuccess) {
                //   Navigator.pushNamedAndRemoveUntil(
                //     context,
                //     AppRoutes.adminDashboard,
                //         (route) => false,
                //   );
                // }
              },
              child:
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(top: 0, left: 10, right: 30),
                            child: Column(
                              children: [
                                SizedBox(height: 50),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 150,
                                          child: Image.asset(
                                            'assets/logo.png',
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 18.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Strings.login,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                Strings.loginSubtitle,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container()
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.white,
                                    Colors.blue.shade50,
                                    Colors.white,
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50))),
                            child: Column(
                              children: [
                                SizedBox(height: 50),
                                if (state is LoginFailed)
                                  Text(
                                    state.message,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                    ),
                                  ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextInputField(
                                      Strings.mobile,
                                      key: Key(Strings.mobile),
                                      controller: _employeeNumberController,
                                      isSecure: false,
                                      onChanged: (username) => context
                                          .read<LoginBloc>()
                                          .add(UsernameChangeEvent(username)),
                                    ),
                                    Text(
                                      state.usernameError ?? "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextInputField(
                                      Strings.password,
                                      key: Key(Strings.password),
                                      controller: _passwordController,
                                      isSecure: true,
                                      onChanged: (password) => context
                                          .read<LoginBloc>()
                                          .add(PasswordChangeEvent(password)),
                                    ),
                                    Text(
                                      state.passwordError ?? "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.forgot
                                        );
                                      },
                                      child: Text(
                                        Strings.forgotpassword,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 50),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(),
                              state is LoginLoading
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircularProgressIndicator(
                                          key: Key(Strings.progressbar),
                                        ),
                                      ],
                                    )
                                  : Button(
                                      key: Key(Strings.login),
                                      Strings.login,
                                      true,
                                      textColor: Colors.white,
                                      color: Colors.red,
                                      onPressed: () {
                                        context.read<LoginBloc>().add(
                                              LoginSubmitted(
                                                _employeeNumberController.text,
                                                _passwordController.text,
                                              ),
                                            );
                                      },
                                    )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.donothaveaccount,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        GestureDetector(
                          key: Key(Strings.register),
                          child: Text(
                            Strings.register,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.blue,
                            ),
                          ),
                          onTap: () {
                            // print(_employeeNumberController.text);
                            // print(_passwordController.text);
                            // context.read<LoginBloc>().add(
                            //       LoginSubmitted(
                            //         _employeeNumberController.text,
                            //         _passwordController.text,
                            //       ),
                            //     );
                            Navigator.pushNamed(
                              context,
                              AppRoutes.signUp
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
