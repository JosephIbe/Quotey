import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

abstract class CategoryQuotesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetQuotesInCategoryEvent extends CategoryQuotesEvent {

  final String categoryName;
  GetQuotesInCategoryEvent({@required this.categoryName});

  @override
  List<Object> get props => [categoryName];

}