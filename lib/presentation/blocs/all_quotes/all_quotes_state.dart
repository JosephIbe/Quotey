import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:quotey/data/models/quotes_model.dart';

@immutable
abstract class AllQuotesState extends Equatable {
  @override
  List<Object> get props => [];
}

class AllQuotesStateInitial extends AllQuotesState {}

class AllQuotesStateLoading extends AllQuotesState {}

class AllQuotesStateSuccess extends AllQuotesState {
  final List<QuotesModel> quotesList;
  AllQuotesStateSuccess({@required this.quotesList});
}

class AllQuotesStateFailure extends AllQuotesState {
  final String errorMessage;
  AllQuotesStateFailure({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}