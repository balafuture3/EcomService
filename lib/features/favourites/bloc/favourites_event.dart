part of 'favourites_bloc.dart';

class FavouritesEvent {}

class FavouritesInit extends FavouritesEvent
{

}
class FavouritesDelete extends FavouritesEvent
{
  final int index;
  final num? productId;
  FavouritesDelete(this.index,this.productId);

}
class AddCardEvent extends FavouritesEvent
{
  final int index;
  final num? productId;
  final num? quantity;
  final String? price;
  final String name;
  final String? colorVarient;
  final String? sizeVarient;
  AddCardEvent(this.index,this.productId,this.quantity,this.price,this.name,this.colorVarient,this.sizeVarient);
}