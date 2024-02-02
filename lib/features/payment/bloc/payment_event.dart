part of 'payment_bloc.dart';

class PaymentEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PaymentInit extends PaymentEvent {}

class PaymentDefault extends PaymentEvent {
  final num id;
  final int index;
  PaymentDefault(this.id, this.index);
}

class NewPaymentDefault extends PaymentEvent {
  final bool defaultpay;
  NewPaymentDefault(this.defaultpay);
}

class AddCard extends PaymentEvent {
  String name;
  String cvv;
  String cardNo;
  int defaultPayment;
  String expiry;
  AddCard(this.name, this.cvv, this.cardNo, this.defaultPayment, this.expiry);
}

class DeleteCard extends PaymentEvent {
  final num id;
  DeleteCard(this.id);
}