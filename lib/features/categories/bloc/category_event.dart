part of 'category_bloc.dart';

class CategoryEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryInit extends CategoryEvent
{

}
class CategorySelect extends CategoryEvent
{
  final int selectedindex;
  CategorySelect(this.selectedindex);

}