part of 'product_list_bloc.dart';

class ProductListState extends Equatable{
  final SimilarProductResponse? response;
  final FavouritesResponse? favouritesResponse;
  final bool loading;
  final String? message;
  final String saerchvalue;
  ProductListState({this.response,this.loading=true,this.message,this.favouritesResponse,this.saerchvalue=""});
  ProductListState copyWith({
    SimilarProductResponse? response,
    FavouritesResponse? favouritesResponse,
    bool? loading,
    String? message,
    String? saerchvalue

  }) {
    return ProductListState(
        response: response ?? this.response,loading: loading??this.loading,message: message??this.message,favouritesResponse: favouritesResponse??this.favouritesResponse,saerchvalue:saerchvalue?? this.saerchvalue
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response,loading,message,favouritesResponse,saerchvalue];
}

class ProductListInitial extends ProductListState {

}
