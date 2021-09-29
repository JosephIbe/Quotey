import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

abstract class AuthorQuotesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetQuotesByAuthorEvent extends AuthorQuotesEvent {

  final String authorSlug;
  GetQuotesByAuthorEvent({this.authorSlug});

  @override
  List<Object> get props => [authorSlug];

}