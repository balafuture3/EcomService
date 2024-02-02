part of 'dash_bloc.dart';

class DashEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DashInit extends DashEvent{
  final int limit;
  final int offset;

  DashInit(this.limit,this.offset);
  @override
  // TODO: implement props
  List<Object?> get props => [limit,offset];

}
class DashBottonIndex extends DashEvent {
  final int selectedindex;
  DashBottonIndex(this.selectedindex);
  @override
  // TODO: implement props
  List<Object?> get props => [selectedindex];
}
class DashSearch extends DashEvent{
  final String query;
  DashSearch(this.query);
  @override
  // TODO: implement props
  List<Object?> get props => [query];

}
class FavouriteInsertEvent extends DashEvent{
  final num? productId;
  FavouriteInsertEvent(this.productId);
  @override
  // TODO: implement props
  List<Object?> get props => [productId];

}
class FavouriteDeleteEvent extends DashEvent{
  final num? productId;
  FavouriteDeleteEvent(this.productId);
  @override
  // TODO: implement props
  List<Object?> get props => [productId];

}
class LoadMoreEvent extends DashEvent{
  final int limit;
  final int offset;

  LoadMoreEvent(this.limit,this.offset);
  @override
  // TODO: implement props
  List<Object?> get props => [limit,offset];

}
class DashRefresh extends DashEvent{

  DashRefresh();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}