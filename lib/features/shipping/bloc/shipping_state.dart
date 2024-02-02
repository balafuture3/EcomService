part of 'shipping_bloc.dart';
class ShippingState extends Equatable{
  final bool loading;
  final bool defaultpay;
  final ShippingResponse? response;
  final String? message;
  final int? selectedindex;
  ShippingState( {this.loading=true,this.defaultpay=true,this.message,this.response,this.selectedindex});

  ShippingState copyWith({
    bool? loading,
    bool? defaultpay,
    ShippingResponse? response,
    String? message,
    int? selectedindex})
  {
    return ShippingState(defaultpay:defaultpay??this.defaultpay,selectedindex:selectedindex??this.selectedindex,loading:loading??this.loading,response:response??this.response,message:message??this.message,);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [loading,message,response,selectedindex,defaultpay];
}
