part of 'checkout_bloc.dart';
class CheckoutState extends Equatable{
  final bool loading;
  final ShippingResponse? response;
  final PaymentResponse? paymentResponse;
  final String? message;
  CheckoutState( {this.loading=true,this.response, this.message,this.paymentResponse});

  CheckoutState copyWith({  bool? loading,
    ShippingResponse? response,
    PaymentResponse? paymentResponse,
    String? message})
  {
    return CheckoutState(loading:loading??this.loading,paymentResponse:paymentResponse??this.paymentResponse,response:response??this.response,message:message??this.message,);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [loading,response,message,paymentResponse];
}

class OrderSuccess extends CheckoutState
{

}