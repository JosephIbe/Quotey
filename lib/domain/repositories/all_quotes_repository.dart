import 'package:quotey/data/models/quotes_model.dart';

abstract class AllQuotesRepository {
  Future<List<QuotesModel>> getAllQuotes();
}