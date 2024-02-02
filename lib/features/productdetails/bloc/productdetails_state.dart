part of 'productdetails_bloc.dart';


class ProductdetailsState extends Equatable {
  final ProductDetailResponse? response;
  final SimilarProductResponse? response1;
  final bool loading;
  final String? message;
  final int imgeindex;
  final int sizeindex;
  final int colorindex;
  final int addcart;

  ProductdetailsState({
    this.response,
    this.response1,
    this.loading=true,
    this.addcart=0,
    this.message,
    this.imgeindex=0,
    this.sizeindex=0,
    this.colorindex=0
  });

  ProductdetailsState copyWith({
    ProductDetailResponse? response,
    SimilarProductResponse? response1,
    bool? loading,
    int? addcart,
    String? messsage,
    int? imgeindex,
    int? colorindex,
    int? sizeindex
  }) {
    return ProductdetailsState(
        response: response ?? this.response,response1: response1?? this.response1,loading: loading??this.loading,addcart: addcart??this.addcart,message: messsage??this.message,imgeindex: imgeindex??this.imgeindex,
      colorindex: colorindex ?? this.colorindex, sizeindex: sizeindex??this.sizeindex
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [response,response1,message,loading,imgeindex,colorindex,sizeindex,addcart];
}
class ProductdetailsInitial extends ProductdetailsState {}
class ProducDetailsLoading extends ProductdetailsState{}
