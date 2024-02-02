import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecomservice/model/AddCartRequest.dart';
import 'package:ecomservice/model/ProductDetailResponse.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/AddcartTest.dart';
import '../../../model/SimilarProductResponse.dart';
import '../../../network/api_error.dart';
import '../../../repo/productdetailrepo.dart';
import '../../../values/strings.dart';

part 'productdetails_event.dart';
part 'productdetails_state.dart';

class ProductdetailsBloc extends Bloc<ProductdetailsEvent, ProductdetailsState> {
  final ProductDetailRepository repository;
  final limit=5;
  final offset=0;
  final CarouselController controller = CarouselController();
  ProductdetailsBloc(this.repository) : super(ProductdetailsState()) {
    on<ProductDetailsInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse =
          await repository.ProductCall(event.productId);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(response:apiSiteResponse.data,loading: false ));
        apiSiteResponse = await repository.SimilarProductCall(apiSiteResponse.data.data.l3CategoryId,limit,offset);
        emit(state.copyWith(response1:apiSiteResponse.data,loading: false ));
      } else {
        emit(state.copyWith(messsage: apiSiteResponse.message,loading: false));
      }

    });
    on<ImageChangeEvent>((event, emit) async {
      emit(state.copyWith(imgeindex: event.index,loading: false ));
    });
    on<SizeChangeEvent>((event, emit) async {
      emit(state.copyWith(sizeindex: event.index,loading: false ));
    });
    on<ColorChangeEvent>((event, emit) async {
      print("ColorChangeEvent");
      emit(state.copyWith(colorindex: event.index,loading: false ));
    });
    on<AddCardEvent>((event,emit) async{
      emit(state.copyWith(loading: true));
      AddcartTest request =AddcartTest().copyWith(details: [Details(productId:event.productId,quantity: 1,price: event.price.toString(),productName: event.name,userId: int.parse(Strings.userid),colorVarient: event.colorVarient,sizeVarient: event.sizeVarient)]);
      ApiResponse apiSiteResponse = await repository.AddCartCall(request);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(addcart: 1));
        emit(state.copyWith(addcart: 0));
      } else {
        emit(state.copyWith(loading: false,messsage: apiSiteResponse.message,addcart: 2));
        emit(state.copyWith(addcart: 0));
      }

    });
  }
}
