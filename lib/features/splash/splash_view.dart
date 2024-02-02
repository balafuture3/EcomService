import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/router.dart';
import 'bloc/splash_bloc.dart';
import 'bloc/splash_event.dart';
import 'bloc/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {


  @override
  void dispose() {
    super.dispose();
  }

  void startProgress() {
    context.read<SplashBloc>().controller.forward();
  }

  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    context.read<SplashBloc>().animation = CurveTween(curve: Curves.easeInOutCubicEmphasized).animate(context.read<SplashBloc>().controller)
      ..addListener(() {
        context.read<SplashBloc>().add(AnimLoadEvent(context.read<SplashBloc>().animation.value));
      })..addStatusListener((status) {
        print(status);
      });
    context.read<SplashBloc>().animation1 = CurveTween( curve: Curves.bounceOut).animate(context.read<SplashBloc>().controller)
      ..addListener(() {
        context.read<SplashBloc>().add(Anim1LoadEvent(context.read<SplashBloc>().animation1.value));
      });
    startProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
        if (state is SplashFinished) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.login, (route) => false);
        }
      }, builder: (context, state) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                      animation: context.read<SplashBloc>().controller,
                      builder: (BuildContext context, Widget? child) {
                        return BlocBuilder<SplashBloc, SplashState>(
                            builder: (BuildContext context, SplashState state) {
                          return Container(
                              height: state.anim2 * 150,
                              width: state.anim2 * 150,
                              child: Image.asset('assets/logo.png'));
                        });
                      }),
                  Container(
                      width: 220,
                      height: 220,
                      // padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 7,
                        value: state.anim1,
                        color: Colors.blue.shade900,
                        backgroundColor: Colors.white,
                      )),
                  // Text(
                  //   (state.anim1 * 100).round().toString() + "%",
                  //   style: TextStyle(
                  //       color: Colors.grey.shade700,
                  //       fontSize: 10,
                  //       fontWeight: FontWeight.w800),
                  // ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
