import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';

import 'package:quotey/domain/repositories/all_quotes_repository.dart';

import 'package:quotey/presentation/blocs/category_quotes/category_quotes_event.dart';
import 'package:quotey/presentation/blocs/category_quotes/category_quotes_state.dart';

class CategoriesQuotesBloc extends Bloc<CategoryQuotesEvent, CategoryQuotesState> {

  final AllQuotesRepository _repository;

  CategoriesQuotesBloc(AllQuotesRepository repository)
      : assert(repository != null),
        _repository = repository,
        super(CategoryQuotesStateStateInitial());

  @override
  Stream<CategoryQuotesState> mapEventToState(CategoryQuotesEvent event) async* {
    if(event is GetQuotesInCategoryEvent){
      yield* _mapGetAllCategoriesEventToState(event);
    }
  }

  Stream<CategoryQuotesState> _mapGetAllCategoriesEventToState(GetQuotesInCategoryEvent event) async* {
    yield CategoryQuotesStateStateLoading();

    var page = 0;

    try {
      page++;
      var categoryQuotes = await _repository.getQuotesInCategory(categoryName: event.categoryName, page: page);
      if(categoryQuotes.isNotEmpty) {
        yield CategoryQuotesStateSuccess(quotesList: categoryQuotes);
      } else {
        yield CategoryQuotesStateFailure(reason: 'Invalid or Empty Response');
      }
    }  on SocketException {
      yield CategoryQuotesStateFailure(reason: 'Check Your Internet Connection');
    } catch (err) {
      print('err in response \n $err');
      // if(err) {
      //   yield AllQuotesStateFailure(errorMessage: 'Unknown error occurred');
      // }
    }
  }

}