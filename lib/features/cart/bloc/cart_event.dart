part of 'cart_bloc.dart';
class CartEvent {}
class CartInit extends CartEvent
{

}
class ItemIncreaseEvent extends CartEvent{
  final int qty;
  final int index;
  final num? productId;
  ItemIncreaseEvent(this.qty,this.index,this.productId);
}
class ItemDecreaseEvent extends CartEvent{
  final int qty;
  final int index;
  final num? productId;
  ItemDecreaseEvent(this.qty,this.index,this.productId);
}
class PlaceOrderEvent extends CartEvent
{

}
class FavouriteAddEvent extends CartEvent{
  final num? productId;
  final int index;
  FavouriteAddEvent(this.productId,this.index);
}
class RemoveCartEvent extends CartEvent{
  final num? productId;
  final int index;
  RemoveCartEvent(this.productId,this.index);
}
class PromoAddEvent extends CartEvent{
  final String? promocode;
  final String? promoPercent;
  PromoAddEvent(this.promocode,this.promoPercent);
}
class PromoValidation extends CartEvent{
  final int? valid;
  PromoValidation(this.valid);
}