import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SplashState extends Equatable {
  final double anim1;
  final double anim2;

   SplashState({this.anim1 = 0, this.anim2 = 0});

  SplashState copyWith({
    double? anim1,
    double? anim2,
  }) {
    return SplashState(anim1: anim1 ?? this.anim1, anim2: anim2 ?? this.anim2);
  }

  @override
  List<Object> get props => [anim1, anim2];
}

class SplashFinished extends SplashState {
   SplashFinished();
   @override
   List<Object> get props => [];
}
