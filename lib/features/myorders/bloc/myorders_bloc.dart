import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/model/MyOrdersResponse.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../network/api_error.dart';
import '../../../repo/myordersrepo.dart';
import '../../../values/strings.dart';

part 'myorders_event.dart';
part 'myorders_state.dart';

class MyordersBloc extends Bloc<MyordersEvent, MyordersState> {
  final MyOrdersRepo repository;
  MyordersBloc(this.repository) : super(MyordersState()) {
    on<MyOrdersInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.MyOrderscall(Strings.userid);
      if (apiSiteResponse.data != null) {
        print("object");
        emit(state.copyWith(loading: false,response: apiSiteResponse.data));
      }
    });
  }
}
