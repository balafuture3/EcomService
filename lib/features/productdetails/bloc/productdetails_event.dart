part of 'productdetails_bloc.dart';

 class ProductdetailsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ProductDetailsInit extends ProductdetailsEvent{
  final int productId;
  ProductDetailsInit(this.productId);
}
class ImageChangeEvent extends ProductdetailsEvent
{
  final int index;
  ImageChangeEvent(this.index);
}
class ColorChangeEvent extends ProductdetailsEvent
{
  final int index;
  ColorChangeEvent(this.index);
}
class SizeChangeEvent extends ProductdetailsEvent
{
  final int index;
  SizeChangeEvent(this.index);
}
class AddCardEvent extends ProductdetailsEvent
{
  final num? productId;
  final num? quantity;
  final String? price;
  final String name;
  final String? colorVarient;
  final String? sizeVarient;
  AddCardEvent(this.productId,this.quantity,this.price,this.name,this.colorVarient,this.sizeVarient);
}