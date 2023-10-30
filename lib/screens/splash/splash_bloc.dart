import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'SplashStatus.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<SplashState> emit) async {
    emit(state.copyWith(formstatus: const SplashLoading()));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(formstatus: SplashFinished()));
  }
}
