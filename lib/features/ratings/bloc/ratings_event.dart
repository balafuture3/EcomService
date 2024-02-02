part of 'ratings_bloc.dart';

class RatingsEvent {}
class RatingsInit extends RatingsEvent{
  num? productId;
  RatingsInit(this.productId);
}
class ImageAdd extends RatingsEvent
{
  Data1 image;
  ImageAdd(this.image);
}
class RatingsAdd extends RatingsEvent
{
  Data1 image;
  String? comments;
  double? ratings;
  num? productId;
  RatingsAdd(this.image,this.comments,this.ratings,this.productId);
}