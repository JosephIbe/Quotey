import 'package:quotey/data/models/category_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<CategoryModel>> getAllQuotesInCategory({String categoryId});
}