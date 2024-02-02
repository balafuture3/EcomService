part of 'favourites_bloc.dart';
class FavouritesState extends Equatable{
  final bool closeloading;
  final bool result;
  final int id;
  final bool addproductloading;
  final FavouritesDataResponse? response;
  final String? message;

  FavouritesState(
      {this.closeloading = false,this.addproductloading= false,  this.response, this.message,this.id=0,this.result=true});

  FavouritesState copyWith({ bool? closeloading,
    bool? addproductloading,
    bool? result,
    FavouritesDataResponse? response,
    String? message,
    int? id}) {
    return FavouritesState(
      result: result??this.result,
      addproductloading: addproductloading ?? this.addproductloading,
      closeloading: closeloading ?? this.closeloading,
      response: response ?? this.response,
      message: message ?? this.message,
      id: id ?? this.id,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[closeloading,response,message,addproductloading,id,result];
}
class FavouritesInitial extends FavouritesState {}
