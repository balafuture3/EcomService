part of 'dash_bloc.dart';

class DashState extends Equatable {
  final DashinitResponse? response;
  final SearchResponse? searchdata;
  final FavouritesResponse? favouritesResponse;
  final bool loading;
  final String? message;
  final int selectedindex;
  final int cartcount;

   DashState({
     this.response,
     this.searchdata,
     this.loading=true,
     this.message,
     this.selectedindex=2,
     this.cartcount=0,
     this.favouritesResponse
  });

  DashState copyWith({
    DashinitResponse? response,
    SearchResponse? searchdata,
    bool? loading,
    String? messsage,
    int? selectedindex,
    int? cartcount,
    FavouritesResponse? favouritesResponse

  }) {
    return DashState(
      response: response ?? this.response,searchdata: searchdata ?? this.searchdata,loading: loading??this.loading,message: message??this.message,selectedindex: selectedindex??this.selectedindex,
      cartcount: cartcount ?? this.cartcount, favouritesResponse: favouritesResponse ??this.favouritesResponse
    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => [response,searchdata,loading,selectedindex,cartcount,favouritesResponse];
}

class DashInitial extends DashState {}

class FavouritesRefresh extends DashState {}

class DashLoading extends DashState {}

class DashSuccess extends DashState {
  final DashinitResponse response;
  DashSuccess(this.response);
  @override
  // TODO: implement props
  List<Object?> get props => [response];
}

class DashFailed extends DashState {
  final String message;
  DashFailed(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
