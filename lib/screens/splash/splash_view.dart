import 'package:ecomservice/screens/login_page/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/repository.dart';
import 'SplashStatus.dart';
import 'splash_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashBloc()..add(InitEvent()),
      child: Builder(builder: (context) => BlocListener<SplashBloc,SplashState>(
        listener: (BuildContext context, state) {
          if (state.formstatus is SplashFinished) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>RepositoryProvider(
                create: (context) => ApiProvider(), child: Login_Page())), (route) => false);
        }},
        child:_buildPage(context) ,) ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<SplashBloc>(context);

    return Scaffold(
      body: Center(
        child: Stack(
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
      ),
    );
  }
}

