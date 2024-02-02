import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/repo/cartrepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../network/api_error.dart';
import '../../../values/strings.dart';
import 'cart_state.dart';

part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartState()) {
    List<int>? itemcount = [];
    double total = 0;
    TextEditingController promocontroller = TextEditingController();
    on<CartInit>((event, emit) async {
      emit(state.copyWith(addproductloading: true, total: 0));
      ApiResponse apiSiteResponse = await repository.Cartcall(Strings.userid);
      if (apiSiteResponse.data != null) {
        for (int i = 0; i < apiSiteResponse.data.data.length; i++)
        {
          total = total + double.parse(apiSiteResponse.data.data[i].price);
          itemcount.add(1);
        }
        print(itemcount.length);
        emit(state.copyWith(
            response: apiSiteResponse.data,
            addproductloading: false,
            total: total,itemcount: itemcount));
      } else
        emit(state.copyWith(message: apiSiteResponse.message));
 apiSiteResponse = await repository.PromoCodecall();
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(promoResponse: apiSiteResponse.data));
      } else
        emit(state.copyWith(message: apiSiteResponse.message));

      emit(state.copyWith(message: ""));
    });
    on<ItemIncreaseEvent>((event,emit) async {
      total=0;
      itemcount[event.index]= event.qty;
      for (int i = 0; i < state.response!.data!.length; i++) {
        total = total + double.parse(state.response!.data![i].price!)*itemcount[i];
      }
      emit(state.copyWith(total: total));

    });
    on<ItemDecreaseEvent>((event,emit) async {
      total=0;
      itemcount[event.index]= event.qty;
      for (int i = 0; i < state.response!.data!.length; i++) {
        total = total + double.parse(state.response!.data![i].price!)*itemcount[i];
      }
      emit(state.copyWith(total: total));

    });
    on<FavouriteAddEvent>((event,emit) async{
      emit(state.copyWith(addproductloading: true,));
      ApiResponse apiSiteResponse = await repository.FavoritesInsertcall(Strings.userid,event.productId);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(addproductloading: false,message: "Success, item added to favourites",result: true));
        emit(state.copyWith(message: ""));
      } else {
        emit(state.copyWith(addproductloading: false,message: apiSiteResponse.message,result: false));
        emit(state.copyWith(message: ""));
      }

    });
    on<RemoveCartEvent>((event,emit) async{
      emit(state.copyWith(addproductloading: true,));
      ApiResponse apiSiteResponse = await repository.CartDeletecall(Strings.userid,event.productId);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(addproductloading: false));
        emit(state.copyWith(message: ""));
        ApiResponse apiSiteResponse = await repository.Cartcall(Strings.userid);
        if (apiSiteResponse.data != null) {
          total=0;
          for (int i = 0; i < apiSiteResponse.data.data.length; i++)
          {
            total = total + double.parse(apiSiteResponse.data.data[i].price);
          }
          itemcount.removeAt(event.index);
          emit(state.copyWith(
              response: apiSiteResponse.data,
              addproductloading: false,
              total: total,itemcount: itemcount));
        } else
          emit(state.copyWith(message: apiSiteResponse.message));
        emit(state.copyWith(message: ""));

      } else {
        emit(state.copyWith(addproductloading: false,message: apiSiteResponse.message,result: false));
        emit(state.copyWith(message: ""));
        // emit(state.copyWith(loading: false,messsage: apiSiteResponse.message));
      }

    });

    on<PromoAddEvent>((event,emit) async {
      emit(state.copyWith(promocode: event.promocode,promoPercent: event.promoPercent));
    });

    on<PromoValidation>((event,emit) async {
      print("valid bloc");
      emit(state.copyWith(promovalid: event.valid));
    });
  }
}
