import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:quotey/domain/repositories/authors_repository.dart';

import 'package:quotey/presentation/blocs/authors/authors_event.dart';
import 'package:quotey/presentation/blocs/authors/authors_state.dart';


class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {

  final AuthorsRepository _repository;

  AuthorsBloc(AuthorsRepository repository)
      : assert (repository != null),
      _repository = repository,
      super (AuthorsStateInitial());

  @override
  Stream<AuthorsState> mapEventToState(AuthorsEvent event) async* {
    if (event is GetAllAuthorsEvent) {
      yield* _mapGetAllAuthorsEventToState(event);
    }
  }

  Stream<AuthorsState> _mapGetAllAuthorsEventToState(GetAllAuthorsEvent event) async* {
    yield AuthorsStateInitial();

    try {
      var authors = await _repository.getAllAuthors();
      if(authors.isNotEmpty) {
        yield AuthorsStateSuccess(authorsList: authors);
      } else {
        yield AuthorsStateSuccess(authorsList: null);
      }
    } on Exception{
      yield AuthorsStateFailure(reason: 'An error occurred');
    } catch (err) {
      print('err fetching authors:\n $err');
    }
  }

}
