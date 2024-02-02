import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {}

class InitEvent extends SplashEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AnimLoadEvent extends SplashEvent {
  final double animvalue;
  AnimLoadEvent(this.animvalue);
  @override
  // TODO: implement props
  List<Object?> get props => [animvalue];
}

class Anim1LoadEvent extends SplashEvent {
  final double animvalue;
  Anim1LoadEvent(this.animvalue);
  @override
  // TODO: implement props
  List<Object?> get props => [animvalue];
}
