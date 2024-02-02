import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/network/api_error.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/CategoryResponse.dart';
import '../../../repo/categoriesrepo.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;
  CategoryBloc(this.repository) : super(CategoryInitial()) {
    on<CategorySelect>((event, emit)
    {
      print(event.selectedindex);
      emit(state.copyWith(selectedindex: event.selectedindex));
    });
    on<CategoryInit>((event, emit) async {
      state.copyWith(loading: true);
      ApiResponse apiSiteResponse = await repository.Categorycall();
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(response: apiSiteResponse.data,loading: false,));
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }

    });
  }
}
