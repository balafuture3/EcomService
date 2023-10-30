import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../repo/repository.dart';
import '../../utils/customBackground.dart';
import '../../utils/customButton.dart';
import '../../utils/customEditText.dart';
import '../../values/dimensions.dart';
import '../../values/strings.dart';
import 'FormSubmissionStatus.dart';
import 'login_bloc.dart';

class Login_Page extends StatelessWidget {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Login_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            LoginBloc(context.read<ApiProvider>(),context),
        child: Builder(
            builder: (context) => BlocListener<LoginBloc, LoginState>(
                  listener: (BuildContext context, state) {
                    final event = state.formstatus;
                    if (kDebugMode) {
                      print("Debug state ${state.formstatus}");
                    }
                    if (event is LoginSuccess) {
                      print(state.formstatus);
                      Navigator.pushReplacementNamed(context, "/dash");
                    }
                    else if (event is LoginFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(event.exception),
                      ));
                    }
                  },
                  child: _buildPage(context),
                )));
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomBackground(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.all(Dimensions.padding_all),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/icon.png",height: 80,width: 80,),
                    const SizedBox(
                      height: 120.0,
                      width: 120.0,
                      child: CircularProgressIndicator(strokeWidth: 4,color: Colors.indigo,),
                    )

                  ],
                ),
                SizedBox(
                  height: height / 20,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    var data = state.formstatus;
                    return data is TextError
                        ? CustomeditText(
                            errortext: data.usernameError != ""
                                ? data.usernameError
                                : null,
                            controller: usernameController,
                            icondata: Icons.contacts_rounded,
                            labeltext: Strings.login_et_lt_username,
                            onChanged: (Username) {
                              bloc.add(TextChangeEvent(
                                  username: Username,
                                  password: passwordController.text));
                            },
                          )
                        : CustomeditText(
                            errortext: null,
                            controller: usernameController,
                            icondata: Icons.contacts_rounded,
                            labeltext: Strings.login_et_lt_username,
                            onChanged: (Username) {
                              bloc.add(TextChangeEvent(
                                  username: Username,
                                  password: passwordController.text));
                            },
                          );
                  },
                ),
                SizedBox(
                  height: height / 80,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    var data = state.formstatus;
                    return data is TextError? CustomeditText(
                      errortext: data.passwordError!=""?data.passwordError:null,
                      controller: passwordController,
                      icondata: Icons.password,
                      labeltext: Strings.login_et_lt_password,
                      onChanged: (Password) {
                        bloc.add(TextChangeEvent(
                            username: usernameController.text,
                            password: Password));
                      },
                    ): CustomeditText(
                      errortext: null,
                      controller: passwordController,
                      icondata: Icons.password,
                      labeltext: Strings.login_et_lt_password,
                      onChanged: (Password) {
                        bloc.add(TextChangeEvent(
                            username: usernameController.text,
                            password: Password));
                      },
                    );
                  },
                ),
                SizedBox(
                  height: height / 80,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.formstatus is ProcessForm
                        ? const CircularProgressIndicator()
                        : state.formstatus is FormValidated || state.formstatus is LoginFailed
                            ? CustomButton(
                                onClick: () {
                                  bloc.add(LoginSubmitEvent(
                                      username: usernameController.text,
                                      Password: passwordController.text));
                                },
                                background: Colors.red,
                                text: 'Login',
                                radius: 10,
                                textcolor: Colors.white,
                              )
                            : CustomButton(
                                onClick: () {},
                                background: Colors.grey,
                                text: 'Login',
                                radius: 10,
                                textcolor: Colors.white,
                              );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
