part of 'myorders_bloc.dart';

class MyordersState extends Equatable{
  MyOrdersResponse? response;
  bool loading;
  String? message;
  MyordersState({this.response,this.loading=false,this.message});

  MyordersState copyWith({
    MyOrdersResponse? response,
    bool? loading,
    String? message

  }) {
    return MyordersState(
        response: response ?? this.response,loading: loading??this.loading,message: message??this.message
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [response,loading,message];

}
