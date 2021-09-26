import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:quotey/domain/repositories/categories_repository.dart';

import 'package:quotey/presentation/blocs/categories/categories_event.dart';
import 'package:quotey/presentation/blocs/categories/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {

  final CategoriesRepository _repository;

  CategoriesBloc(CategoriesRepository repository)
      : assert(repository != null),
      _repository = repository,
      super(CategoriesStateInitial());

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if(event is GetAllCategoriesEvent){
      yield* _mapGetAllCategoriesEventToState(event);
    }
  }

  Stream<CategoriesState> _mapGetAllCategoriesEventToState(GetAllCategoriesEvent event) async* {
    yield CategoriesStateLoading();
    try {
      var categories = await _repository.getAllCategories();
      if(categories.isNotEmpty) {
        yield CategoriesStateSuccess(categoriesList: categories);
      } else {
        yield CategoriesStateFailure(reason: 'Invalid or Empty Response');
      }
    }  on SocketException {
      yield CategoriesStateFailure(reason: 'Check Your Internet Connection');
    } catch (err) {
      print('err in response \n $err');
      // if(err) {
      //   yield AllQuotesStateFailure(errorMessage: 'Unknown error occurred');
      // }
    }
  }

}