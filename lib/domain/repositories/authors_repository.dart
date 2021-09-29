import 'package:quotey/data/models/authors_model.dart';
import 'package:quotey/data/models/quotes_model.dart';

abstract class AuthorsRepository {
  Future<List<AuthorsModel>> getAllAuthors();
  Future<List<QuotesModel>> getAuthorsQuotes({String authorSlug});
}