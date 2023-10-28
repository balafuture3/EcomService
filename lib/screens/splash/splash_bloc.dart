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
    // var status = await Permission.
    // if (!status.isGranted) {
    //   PermissionStatus permissionStatus = await Permission.camera.request();
    //   print("permissionStatus ${permissionStatus.isGranted}");
    // } else {
    //   // access the resoruce
    // }

    emit(state.copyWith(formstatus: SplashLoading()));
    await Future.delayed(Duration(seconds: 3));
    var response = await Dio().get('http://www.google.com');
    print(response);
    emit(state.copyWith(formstatus: SplashFinished()));
  }
}
