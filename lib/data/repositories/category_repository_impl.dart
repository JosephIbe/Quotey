import 'package:flutter/material.dart';

import 'package:quotey/data/data_sources/categories_remote_data_source.dart';

import 'package:quotey/data/models/category_model.dart';

import 'package:quotey/domain/repositories/categories_repository.dart';

class CategoryRepositoryImpl extends CategoriesRepository {

  final CategoriesRemoteDataSource dataSource;
  CategoryRepositoryImpl({@required this.dataSource});

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    return await dataSource.getAllCategories();
  }

}