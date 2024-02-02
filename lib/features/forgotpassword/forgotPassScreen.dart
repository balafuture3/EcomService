import 'package:ecomservice/features/forgotpassword/bloc/forgotpassword_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/button.dart';
import '../../utils/router.dart';
import '../../utils/text_input_field.dart';
import '../../values/strings.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ForgotpasswordBloc, ForgotpasswordState>(
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only( bottom: 20, left: 20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          InkWell(
                          onTap: (){
              Navigator.pop(context);
              },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0,right: 10),
                  child: Icon(Icons.arrow_back),
                ),
              ),Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          const Text("Don't worry,",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                              )),
                          const Text("we will help you",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45,
                              )),
                        ],
                      ),
                    ])),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.white.withOpacity(0.2),
                                  BlendMode.dstATop),
                              image: AssetImage('assets/splash.png'),
                            ),
                            // gradient: LinearGradient(
                            //   begin: Alignment.topLeft,
                            //   end: Alignment.bottomRight,
                            //   colors: [
                            //     Colors.white,
                            //     Colors.blue.shade50,
                            //
                            //     Colors.white,
                            //
                            //   ],
                            // ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextInputField(
                                    Strings.password,
                                    key: Key(Strings.password),
                                    controller: context
                                        .read<ForgotpasswordBloc>()
                                        .passwordController,
                                    isSecure: true,
                                    onChanged: (password) => context
                                        .read<ForgotpasswordBloc>()
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextInputField(
                                    Strings.conformPassword,
                                    key: Key(Strings.conformPassword),
                                    controller: context
                                        .read<ForgotpasswordBloc>()
                                        .confirmpasswordController,
                                    isSecure: true,
                                    onChanged: (password) => context
                                        .read<ForgotpasswordBloc>()
                                        .add(ConfirmPasswordChangeEvent(password)),
                                  ),
                                  Text(
                                    state.confirmpasswordError ?? "",
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
                                    Strings.mobile,
                                    key: Key(Strings.mobile),
                                    controller: context
                                        .read<ForgotpasswordBloc>()
                                        .mobileNumberController,
                                    isSecure: false,
                                    onChanged: (mobile) => context
                                        .read<ForgotpasswordBloc>()
                                        .add(MobileNumberChangeEvent(mobile)),
                                  ),
                                  Text(
                                    state.mobilenumberError ?? "",
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
                                    Strings.email,
                                    key: Key(Strings.email),
                                    controller: context
                                        .read<ForgotpasswordBloc>()
                                        .emailController,
                                    isSecure: false,
                                    onChanged: (email) => context
                                        .read<ForgotpasswordBloc>()
                                        .add(EmailChangeEvent(email)),
                                  ),
                                  Text(
                                    state.emailError ?? "",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state is ForgotLoading
                            ? const CircularProgressIndicator()
                            : Button(
                          "Submit",true,
                          // state.username.isNotEmpty&&state.password.isNotEmpty&&state.confirmpassword.isNotEmpty&&state.mobilenumber.isNotEmpty&&state.email.isNotEmpty&&state.address.isNotEmpty&&state.confirmpasswordError==""&&state.passwordError==""&&state.usernameError==""&&state.emailError==""&&state.mobilenumberError==""&&state.addressrError=="",
                          onPressed: () {
                            context
                                .read<ForgotpasswordBloc>()
                                .add(ForgotPassSubmit());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, ForgotpasswordState state) {
            print(state);
            if (state is ForgotSuccess) {
              Fluttertoast.showToast(msg: "Success! Please sign in");
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                    (route) => false,
              );
            } else if (state is ForgotFailed) {
              showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Failed"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,
                  content:  Text(state.message),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false); // Dismiss the alert
                      },
                      child: Text("OK"),
                    ),
                  ],

                ); });
            }
          },
        ),
      )
    );
  }
}
