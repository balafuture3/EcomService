part of 'product_list_bloc.dart';

class ProductListEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
class ProductInit extends ProductListEvent
{
  final int id;
  final int limit;
  final int offset;
  ProductInit(this.id,this.limit,this.offset);
  @override
  // TODO: implement props
  List<Object?> get props => [id,limit,offset];
}
class FavouriteInsertEvent extends ProductListEvent{
  final num? productId;
  FavouriteInsertEvent(this.productId);
  @override
  // TODO: implement props
  List<Object?> get props => [productId];

}
class FavouriteDeleteEvent extends ProductListEvent{
  final num? productId;
  FavouriteDeleteEvent(this.productId);
  @override
  // TODO: implement props
  List<Object?> get props => [productId];

}
class LoadMoreEvent extends ProductListEvent{
  final int id;
  final int limit;
  final int offset;

  LoadMoreEvent(this.id,this.limit,this.offset);
  @override
  // TODO: implement props
  List<Object?> get props => [id,limit,offset];

}
class RefreshEvent extends ProductListEvent{
  final String searchvalue;
  RefreshEvent(this.searchvalue);
  @override
  // TODO: implement props
  List<Object?> get props => [searchvalue];
}