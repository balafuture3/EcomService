part of 'myorderdetail_bloc.dart';

class MyorderdetailState extends Equatable{
  bool loading;
  String? message;
  Data1? images;
  OrderDetailResponse? response;
  MyorderdetailState({this.response,this.message,this.loading=true,this.images});

  MyorderdetailState copyWith({ String? message, bool? loading, OrderDetailResponse? response,Data1? images})
  {
    return MyorderdetailState(images:images??this.images,response: response??this.response,message: message??this.message,loading: loading??this.loading);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [loading,message,response,images];


}
