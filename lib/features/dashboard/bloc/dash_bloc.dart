import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/model/DashinitResponse.dart';
import 'package:ecomservice/model/FavouritesResponse.dart';
import 'package:ecomservice/model/SearchResponse.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../network/api_error.dart';
import '../../../repo/dashboardrepo.dart';
import '../../../values/strings.dart';
part 'dash_event.dart';
part 'dash_state.dart';

class DashBloc extends Bloc<DashEvent, DashState> {
  TextEditingController searchcontroller = TextEditingController();
  late DashboardRepository repository;
  DashBloc(this.repository) : super(DashState()) {
    on<DashInit>(Dashinitcall);
    on<DashSearch>(Dashsearchcall);
    on<DashBottonIndex>(DashBottonIndexcall);
    on<FavouriteInsertEvent>(FavoritesInsertcall);
    on<FavouriteDeleteEvent>(FavoritesDeletecall);
    on<LoadMoreEvent>(LoadMorecall);
    on<DashRefresh>(Dashrefreshcall);
  }
  void Dashrefreshcall(DashRefresh event, Emitter<DashState> emit) async {
    print("Dash Refresh Bloc");
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.Favoritescall(Strings.userid);
    if (apiSiteResponse.data != null) {
      emit(state.copyWith(favouritesResponse: apiSiteResponse.data,loading: false));
    }
    apiSiteResponse = await repository.Cartcall(Strings.userid);
    if (apiSiteResponse.data != null) {
      emit(state.copyWith(cartcount: apiSiteResponse.data.data.length));
    }
  }
  void Dashinitcall(DashInit event, Emitter<DashState> emit) async {
    print("Dash Init Bloc");
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.DashInitcall(event.limit,event.offset);
    if (apiSiteResponse.data != null) {
      emit(state.copyWith(response: apiSiteResponse.data,loading: false,cartcount:apiSiteResponse.data.cartcount ));
    } else {
      emit(state.copyWith(loading: false, messsage: apiSiteResponse.message));
    }
    apiSiteResponse = await repository.Favoritescall(Strings.userid);
    if (apiSiteResponse.data != null) {
      emit(state.copyWith(favouritesResponse: apiSiteResponse.data,loading: false));
    }
  }

  void Dashsearchcall(DashSearch event, Emitter<DashState> emit) async {
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.DashSearchcall(event.query);
    if (apiSiteResponse.data != null) {
      emit(state.copyWith(searchdata: apiSiteResponse.data,loading: false));
    } else {
      emit(state.copyWith(loading: false, messsage: apiSiteResponse.message,searchdata: SearchResponse(data: null)));
    }
  }

  FutureOr<void> DashBottonIndexcall(DashBottonIndex event, Emitter<DashState> emit) {
    print("call");
    emit(state.copyWith(selectedindex: event.selectedindex));
  }

  void FavoritesInsertcall(FavouriteInsertEvent event, Emitter<DashState> emit) async {
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.FavoritesInsertcall(Strings.userid,event.productId);
    if (apiSiteResponse.data != null) {
    apiSiteResponse = await repository.Favoritescall(Strings.userid);
    if (apiSiteResponse.data != null) {
      emit(state.copyWith(favouritesResponse: apiSiteResponse.data,loading: false));
    }
    }
  }
  void FavoritesDeletecall(FavouriteDeleteEvent event, Emitter<DashState> emit) async {
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.FavoritesDeletecall(Strings.userid,event.productId);
    if (apiSiteResponse.data != null) {
      apiSiteResponse = await repository.Favoritescall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(favouritesResponse: apiSiteResponse.data,loading: false));
      }
    }
  }
  void LoadMorecall(LoadMoreEvent event, Emitter<DashState> emit) async {
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.DashInitcall(event.limit,event.offset);
    if (apiSiteResponse.data != null) {
      DashinitResponse dashinitResponse = DashinitResponse(status: true,data:state.response!.data!..addAll(apiSiteResponse.data.data),dashimages: state.response!.dashimages );

      emit(state.copyWith(response: dashinitResponse,loading: false));
    } else {
      emit(state.copyWith(loading: false, messsage: apiSiteResponse.message));
    }
  }
}
