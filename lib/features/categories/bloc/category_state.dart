part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final bool loading;
  final int selectedindex;
  final CategoryResponse? response;
  final String? message;
  CategoryState( {this.loading=true,this.selectedindex=0,this.response, this.message});

  CategoryState copyWith({  bool? loading,
   CategoryResponse? response,
   String? message,
  int? selectedindex})
{
  return CategoryState(selectedindex: selectedindex??this.selectedindex,loading:loading??this.loading,response:response??this.response,message:message??this.message,);
}
  @override
  // TODO: implement props
  List<Object?> get props => [loading,response,message,selectedindex];
}

class CategoryInitial extends CategoryState {}
