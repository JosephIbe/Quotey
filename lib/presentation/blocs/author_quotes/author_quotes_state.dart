import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:quotey/data/models/quotes_model.dart';

abstract class AuthorQuotesState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthorQuotesStateInitial extends AuthorQuotesState {}

class AuthorQuotesStateLoading extends AuthorQuotesState {}

class AuthorQuotesStateSuccess extends AuthorQuotesState {

  final List<QuotesModel> quotesList;
  AuthorQuotesStateSuccess({@required this.quotesList});

}

class AuthorQuotesStateFailure extends AuthorQuotesState {

  final String reason;
  AuthorQuotesStateFailure({@required this.reason});

  @override
  List<Object> get props => [reason];

}