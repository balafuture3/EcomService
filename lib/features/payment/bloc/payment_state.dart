part of 'payment_bloc.dart';

class PaymentState extends Equatable{
  final bool loading;
  final bool defaultpay;
  final PaymentResponse? paymentResponse;
  final String? message;
  final int? selectedindex;
  PaymentState( {this.loading=true,this.defaultpay=true,this.message,this.paymentResponse,this.selectedindex});

  PaymentState copyWith({
    bool? loading,
    bool? defaultpay,
    PaymentResponse? paymentResponse,
    String? message,
  int? selectedindex})
  {
    return PaymentState(defaultpay:defaultpay??this.defaultpay,selectedindex:selectedindex??this.selectedindex,loading:loading??this.loading,paymentResponse:paymentResponse??this.paymentResponse,message:message??this.message,);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [loading,message,paymentResponse,selectedindex,defaultpay];
}
