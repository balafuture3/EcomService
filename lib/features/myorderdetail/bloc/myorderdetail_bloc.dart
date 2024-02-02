import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/model/OrderDetailResponse.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../model/ImagePickerModel.dart';
import '../../../network/api_error.dart';
import '../../../repo/myorderdetailrepo.dart';
import '../../../values/strings.dart';
import '../MyOrderDetail.dart';

part 'myorderdetail_event.dart';
part 'myorderdetail_state.dart';

class MyorderdetailBloc extends Bloc<MyorderdetailEvent, MyorderdetailState> {
  final MyOrderDetailRepo repository;
  double ratings=0;
  MyorderdetailBloc(this.repository) : super(MyorderdetailState()) {
    on<MyOrderInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.MyOrderscall(event.orderId);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(response: apiSiteResponse.data,loading: false ));
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }
    });
    on<ImageAdd>((event, emit) async {
    emit(state.copyWith(images:event.image));
    });
    on<RatingsAdd>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.RatingsCall(event.orderId,event.image,event.ratings,event.comments,Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(message: "Success" ,loading: false));
        emit(state.copyWith(message: "" ));
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }
    });
  }
}
