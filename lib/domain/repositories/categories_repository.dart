abstract class CategoriesRepository {
  Future<List<Category>> getAllCategories();
  Future<List<Category>> getAllQuotesInCategory({String categoryId});
}