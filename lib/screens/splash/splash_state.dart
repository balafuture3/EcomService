


import 'package:ecomservice/screens/splash/SplashStatus.dart';

class SplashState {
  final SplashStatus formstatus;
   SplashState({ this.formstatus= const SplashLoading()});

  SplashState copyWith({
    SplashStatus formstatus =const SplashLoading(),
  })
  {
    return SplashState(
        formstatus: formstatus

    );
  }
}
