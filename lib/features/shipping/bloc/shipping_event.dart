part of 'shipping_bloc.dart';
class ShippingEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ShippingInit extends ShippingEvent {}

class ShippingDefault extends ShippingEvent {
  final num id;
  final int index;
  ShippingDefault(this.id, this.index);
}

class NewShippingDefault extends ShippingEvent {
  final bool defaultpay;
  NewShippingDefault(this.defaultpay);
}

class AddAddress extends ShippingEvent {
  String name;
  String address;
  String city;
  String state;
  String country;
  String zipcode;
  AddAddress(this.name, this.address, this.city, this.state, this.country,this.zipcode);
}

class DeleteAddress extends ShippingEvent {
  final num id;
  DeleteAddress(this.id);
}