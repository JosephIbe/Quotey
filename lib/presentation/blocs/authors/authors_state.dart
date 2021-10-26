import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:quotey/data/models/authors_model.dart';

import 'package:quotey/data/models/quotes_model.dart';

abstract class AuthorsState extends Equatable {

  final List<AuthorsModel> authors;
  AuthorsState({@required this.authors});

  @override
  List<Object> get props => [];
}

class AuthorsStateInitial extends AuthorsState {}

class AuthorsStateLoading extends AuthorsState {}

class AuthorsStateSuccess extends AuthorsState {

  final List<AuthorsModel> authorsList;
  AuthorsStateSuccess({@required this.authorsList});

}

class AuthorsStateFailure extends AuthorsState {

  final String reason;
  AuthorsStateFailure({@required this.reason});

  @override
  List<Object> get props => [reason];

}

class QuotesByAuthorStateSuccess extends AuthorsState {

  final List<QuotesModel> authorQuotesList;
  QuotesByAuthorStateSuccess({@required this.authorQuotesList});

}

class QuotesByAuthorStateFailure extends AuthorsState {

  final String reason;
  QuotesByAuthorStateFailure({@required this.reason});

  @override
  List<Object> get props => [reason];

}