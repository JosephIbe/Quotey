import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:quotey/data/models/quotes_model.dart';

abstract class CategoryQuotesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryQuotesStateStateInitial extends CategoryQuotesState {}

class CategoryQuotesStateStateLoading extends CategoryQuotesState {}

class CategoryQuotesStateSuccess extends CategoryQuotesState {

  final List<QuotesModel> quotesList;
  CategoryQuotesStateSuccess({@required this.quotesList});

}

class CategoryQuotesStateFailure extends CategoryQuotesState {

  final String reason;
  CategoryQuotesStateFailure({@required this.reason});

  @override
  List<Object> get props => [reason];

}