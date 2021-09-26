import 'package:flutter/material.dart';

import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/models/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {

  final APIClient client;
  CategoriesRemoteDataSourceImpl({@required this.client});

  List<CategoryModel> categories = [];

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    categories = await client.get(path: '/tags');
    for (var cat in categories) {
      categories.add(CategoryModel.fromJson(cat));
    }
    print(categories.first);
    return categories;
  }

}