import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quotey/data/models/category_model.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoriesStateInitial extends CategoriesState {}

class CategoriesStateLoading extends CategoriesState {}

class CategoriesStateSuccess extends CategoriesState {

  final List<CategoryModel> categoriesList;
  CategoriesStateSuccess({@required this.categoriesList});

}

class CategoriesStateFailure extends CategoriesState {

  final String reason;
  CategoriesStateFailure({@required this.reason});

  @override
  List<Object> get props => [reason];

}