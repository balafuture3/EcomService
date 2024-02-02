import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/network/api_error.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/ImagePickerModel.dart';
import '../../../model/RatingsResponse.dart';
import '../../../repo/ratingsrepo.dart';
import '../../../values/strings.dart';

part 'ratings_event.dart';
part 'ratings_state.dart';

class RatingsBloc extends Bloc<RatingsEvent, RatingsState> {
  final RatingsRepo repository;
  double ratings=0;
  RatingsBloc(this.repository) : super(RatingsState()) {
    on<RatingsInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse response = await repository.Ratingscall(event.productId);
      if(response.data!=null)
        {
          emit(state.copyWith(response: response.data,loading: false));
        }
    });
    on<ImageAdd>((event, emit) async {
      emit(state.copyWith(images:event.image));
    });
    on<RatingsAdd>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.RatingsAddCall(event.productId,event.image,event.ratings,event.comments,Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(message: "Success" ,loading: false));
        emit(state.copyWith(message: "" ));
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }
    });
  }
}
