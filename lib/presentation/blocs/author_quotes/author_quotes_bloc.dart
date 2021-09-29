import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:quotey/domain/repositories/all_quotes_repository.dart';
import 'package:quotey/domain/repositories/authors_repository.dart';

import 'package:quotey/presentation/blocs/author_quotes/author_quotes_state.dart';
import 'package:quotey/presentation/blocs/author_quotes/author_quotes_event.dart';


class AuthorQuotesBloc extends Bloc<AuthorQuotesEvent, AuthorQuotesState> {

  AuthorsRepository _repository;

  AuthorQuotesBloc(AuthorsRepository repository)
      : assert (repository != null),
      _repository = repository,
      super(AuthorQuotesStateInitial());

  @override
  Stream<AuthorQuotesState> mapEventToState(AuthorQuotesEvent event) async* {
    if(event is GetQuotesByAuthorEvent){
      yield* _mapGetAllCategoriesEventToState(event);
    }
  }

  Stream<AuthorQuotesState> _mapGetAllCategoriesEventToState(GetQuotesByAuthorEvent event) async* {
    yield AuthorQuotesStateLoading();
    try {
      var authorQuotes = await _repository.getAuthorsQuotes(authorSlug:  event.authorSlug);
      if(authorQuotes.isNotEmpty) {
        yield AuthorQuotesStateSuccess(quotesList: authorQuotes);
      } else {
        yield AuthorQuotesStateFailure(reason: 'Invalid or Empty Response');
      }
    }  on SocketException {
      yield AuthorQuotesStateFailure(reason: 'Check Your Internet Connection');
    } catch (err) {
      print('err in response \n $err');
      // if(err) {
      //   yield AllQuotesStateFailure(errorMessage: 'Unknown error occurred');
      // }
    }
  }

}