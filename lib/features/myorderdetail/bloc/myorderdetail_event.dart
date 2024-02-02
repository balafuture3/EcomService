part of 'myorderdetail_bloc.dart';

class MyorderdetailEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class MyOrderInit extends MyorderdetailEvent
{
  num? orderId;
  MyOrderInit(this.orderId);
}
class ImageAdd extends MyorderdetailEvent
{
  Data1 image;
  ImageAdd(this.image);
}
class RatingsAdd extends MyorderdetailEvent
{
  Data1 image;
  String? comments;
  double? ratings;
  num? orderId;
  RatingsAdd(this.image,this.comments,this.ratings,this.orderId);
}