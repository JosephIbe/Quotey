import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllCategoriesEvent extends CategoriesEvent {}
