import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/model/FavouritesDataResponse.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/AddcartTest.dart';
import '../../../network/api_error.dart';
import '../../../repo/favouritesrepo.dart';
import '../../../values/strings.dart';
import '../../dashboard/bloc/dash_bloc.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final FavouritesRepository repository;
  FavouritesBloc(this.repository) : super(FavouritesInitial()) {
    on<FavouritesDelete>(FavoritesDeletecall);
    on<FavouritesInit>((event, emit) async {
      state.copyWith(closeloading: true);
      ApiResponse apiSiteResponse = await repository.Favouritescall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(response: apiSiteResponse.data,closeloading: false,result: true));
        emit(state.copyWith(message: ""));
      } else {
        emit(state.copyWith(closeloading: false, message: apiSiteResponse.message,result: false));
        emit(state.copyWith(message: ""));
      }

    });

    on<AddCardEvent>((event,emit) async{
      emit(state.copyWith(addproductloading: true,id: event.index));
      AddcartTest request =AddcartTest().copyWith(details: [Details(productId:event.productId,quantity: 1,price: event.price.toString(),productName: event.name,userId: int.parse(Strings.userid),colorVarient: event.colorVarient,sizeVarient: event.sizeVarient)]);
      ApiResponse apiSiteResponse = await repository.AddCartCall(request);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(addproductloading: false,message: "Success, item added to cart",result: true));
        emit(state.copyWith(message: ""));
        // emit(state.copyWith(addcart: true));
        // emit(state.copyWith(addcart: false));
      } else {
        emit(state.copyWith(addproductloading: false,message: apiSiteResponse.message,result: false));
        emit(state.copyWith(message: ""));
        // emit(state.copyWith(loading: false,messsage: apiSiteResponse.message));
      }

    });


  }
  void FavoritesDeletecall(FavouritesDelete event, Emitter<FavouritesState> emit) async {
    emit(state.copyWith(closeloading: true,id: event.index));
    ApiResponse apiSiteResponse = await repository.FavoritesDeletecall(Strings.userid,event.productId);
    if (apiSiteResponse.data != null) {
      apiSiteResponse = await repository.Favouritescall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(response: apiSiteResponse.data,closeloading: false,result: true));
      }
    }
  }
}
