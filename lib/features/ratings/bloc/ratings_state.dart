part of 'ratings_bloc.dart';

class RatingsState extends Equatable{

  String? message;
  bool loading;
  RatingsResponse? response;
  Data1? images;
  RatingsState({this.message,this.loading=true,this.response,this.images});

  RatingsState copyWith ( {String? message,
    Data1? images,
  bool? loading,
  RatingsResponse? response })
  {
    return RatingsState(images:images??this.images,message: message??this.message,response: response??this.response,loading: loading??this.loading);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [message,loading,response];

}

