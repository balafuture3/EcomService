import 'package:ecomservice/model/CartDetailResponse.dart';
import 'package:equatable/equatable.dart';

import '../../../model/PromoResponse.dart';

class CartState extends Equatable{
  final bool result;
  final int id;
  final bool loading;
  final int promovalid;
  final String? promocode;
  final String? promoPercent;
  final CartDetailResponse? response;
  final String? message;
  final double total;
  final List<int>? itemcount;
  final PromoResponse? promoResponse;
  CartState(
      {this.promovalid=0,this.promoPercent,this.promocode,this.loading= false,  this.response, this.message,this.id=0,this.result=true,this.total=0,this.itemcount,this.promoResponse});

  CartState copyWith({
    int? promovalid,
    String? promocode,
    String? promoPercent,
    bool? addproductloading,
    bool? result,
    CartDetailResponse? response,
    String? message,
    int? id,
  double? total,
  List<int>? itemcount,
    PromoResponse? promoResponse}) {
    return CartState(
      promovalid: promovalid??this.promovalid,
      promocode:promocode??this.promocode,
      promoPercent:promoPercent??this.promoPercent,
      result: result??this.result,
      loading: addproductloading ?? this.loading,
      response: response ?? this.response,
      message: message ?? this.message,
      id: id ?? this.id,
      total: total??this.total,
        itemcount: itemcount??this.itemcount,
      promoResponse: promoResponse??this.promoResponse

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[response,message,loading,id,result,total,itemcount,promoResponse,promocode,promovalid];
}
class CardInitial extends CartState {}
