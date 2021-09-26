import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:quotey/domain/repositories/all_quotes_repository.dart';
import 'package:quotey/presentation/blocs/all_quotes/all_quotes_state.dart';

import 'all_quotes_event.dart';

class AllQuotesBloc extends Bloc<AllQuotesEvent, AllQuotesState> {

  AllQuotesRepository _repository;

  AllQuotesBloc(AllQuotesRepository repository)
      : assert(repository != null), _repository = repository,
        super(AllQuotesStateInitial());

  @override
  Stream<AllQuotesState> mapEventToState(AllQuotesEvent event) async* {
    if(event is GetAllQuotesEvent) {
      yield* _mapGetAllQuotesEventToState(event);
    }
  }

  Stream<AllQuotesState> _mapGetAllQuotesEventToState(GetAllQuotesEvent event) async* {
    yield AllQuotesStateLoading();
    try {
      var quotes = await _repository.getAllQuotes();
      if(quotes.isNotEmpty) {
        yield AllQuotesStateSuccess(quotesList: quotes);
      } else {
        yield AllQuotesStateFailure(errorMessage: 'Invalid or Empty Response');
      }
    }  on SocketException {
      yield AllQuotesStateFailure(errorMessage: 'Check Your Internet Connection');
    } catch (err) {
      print('err \n $err');
      // if(err) {
      //   yield AllQuotesStateFailure(errorMessage: 'Unknown error occurred');
      // }
    }
  }
}