part of 'checkout_bloc.dart';

class CheckoutEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitEvent extends CheckoutEvent
{

}
class PlaceOrder extends CheckoutEvent
{
  double orderTotal;
  num? shippmentId;
  num? paymentId;
  List<Details> details;
  String? promoCode;
  String? promoPercent;
  PlaceOrder(this.orderTotal,this.shippmentId,this.paymentId,this.details,this.promoCode,this.promoPercent,);

}