import 'package:bloc/bloc.dart';
import 'package:ecomservice/features/splash/bloc/splash_event.dart';
import 'package:flutter/animation.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  late AnimationController controller;
  late Animation animation;
  late Animation animation1;
  double beginAnim = 0.0;
  double endAnim = 1.0;
  SplashBloc() : super( SplashState()) {
    on<AnimLoadEvent>(animload);
    on<Anim1LoadEvent>(anim1load);
  }

  void animload(AnimLoadEvent event, Emitter<SplashState> emit) async {

    if (event.animvalue>= 1) {

      emit( SplashFinished());
      controller.stop();
    }
    else
      emit(state.copyWith(anim1: event.animvalue));
  }

  void anim1load(Anim1LoadEvent event, Emitter<SplashState> emit) async {
    if (event.animvalue>= 1) {

      emit( SplashFinished());
      controller.stop();
    }
    else
    emit(state.copyWith(anim2: event.animvalue));
  }
}
