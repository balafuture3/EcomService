import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../model/FavouritesResponse.dart';
import '../../../model/SimilarProductResponse.dart';
import '../../../network/api_error.dart';
import '../../../repo/productlist.dart';
import '../../../values/strings.dart';
part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepository repository;
  ProductListBloc(this.repository) : super(ProductListInitial()) {
    on<FavouriteInsertEvent>(FavoritesInsertcall);
    on<FavouriteDeleteEvent>(FavoritesDeletecall);
    on<LoadMoreEvent>(LoadMorecall);
    on<RefreshEvent>(Searchcall);
    on<ProductInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse =
          await repository.SimilarProductCall(event.id,event.limit,event.offset);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(response:apiSiteResponse.data,loading: false ));

      } else {
        emit(state.copyWith(message: apiSiteResponse.message,loading: false));
      }
      apiSiteResponse = await repository.Favoritescall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(favouritesResponse: apiSiteResponse.data,loading: false));
      }
    });
  }

  void FavoritesInsertcall(FavouriteInsertEvent event, Emitter<ProductListState> emit) async {
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.FavoritesInsertcall(Strings.userid,event.productId);
    if (apiSiteResponse.data != null) {
      apiSiteResponse = await repository.Favoritescall(Strings.userid);
      if (apiSiteResponse.data != null) {
        print("this");
        emit(state.copyWith(favouritesResponse: apiSiteResponse.data,loading: false));
      }
    }
  }
  void FavoritesDeletecall(FavouriteDeleteEvent event, Emitter<ProductListState> emit) async {
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.FavoritesDeletecall(Strings.userid,event.productId);
    if (apiSiteResponse.data != null) {
      apiSiteResponse = await repository.Favoritescall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(favouritesResponse: apiSiteResponse.data,loading: false));
      }
    }
  }
  void LoadMorecall(LoadMoreEvent event, Emitter<ProductListState> emit) async {
    emit(state.copyWith(loading: true));
    ApiResponse apiSiteResponse = await repository.SimilarProductCall(event.id,event.limit,event.offset);
    if (apiSiteResponse.data != null) {
      SimilarProductResponse similarProductResponse = SimilarProductResponse(status: true,data:state.response!.data!..addAll(apiSiteResponse.data.data) );

      emit(state.copyWith(response: similarProductResponse,loading: false));
    } else {
      emit(state.copyWith(loading: false, message: apiSiteResponse.message));
    }
  }

  FutureOr<void> Searchcall(RefreshEvent event, Emitter<ProductListState> emit) {
      emit(state.copyWith(saerchvalue: event.searchvalue));
  }
}
