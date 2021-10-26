import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quotey/data/models/authors_model.dart';

import 'package:quotey/domain/repositories/authors_repository.dart';

import 'package:quotey/presentation/blocs/authors/authors_event.dart';
import 'package:quotey/presentation/blocs/authors/authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {

  final AuthorsRepository _repository;
  List<AuthorsModel> authorsList = [];

  var page = 0;

  AuthorsBloc(AuthorsRepository repository)
      : assert (repository != null),
      _repository = repository,
      super (AuthorsStateInitial());

  @override
  Stream<AuthorsState> mapEventToState(AuthorsEvent event) async* {
    if (event is GetAuthorsEvent) {
      yield* _mapGetAllAuthorsEventToState(event);
    }
  }

  Stream<AuthorsState> _mapGetAllAuthorsEventToState(GetAuthorsEvent event) async* {
    yield AuthorsStateLoading();
    _getAllAuthors();
  }

  Stream<AuthorsState> _getAllAuthors() async* {
    try {
      page ++;
      List<AuthorsModel> authors = await _repository.getAllAuthors(page: page);
      if(authors.isNotEmpty) {
        authorsList.addAll(authors);
        yield AuthorsStateSuccess(authorsList: authorsList);
      } else {
        yield AuthorsStateSuccess(authorsList: null);
      }
    } on Exception{
      page--;
      yield AuthorsStateFailure(reason: 'An error occurred');
    } catch (err) {
      print('err fetching authors:\n $err');
    }
  }

}