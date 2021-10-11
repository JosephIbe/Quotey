// import 'package:hive/hive.dart';
// import 'package:quotey/data/tables/quotes_table.dart';
//
// abstract class FavoritesDataSource {
//   Future<List<QuotesTable>> getAllQuotesFromDB();
//   Future<void> markQuoteAsFavorite({QuotesTable table});
//   Future<bool> checkIsFavorite({String quoteId});
//   Future<QuotesTable> deleteQuoteAsFavorite({String quoteId});
// }
//
// class FavoritesDataSourceImpl extends FavoritesDataSource {
//
//   @override
//   Future<List<QuotesTable>> getAllQuotesFromDB() async {
//     print('in data source, called db');
//     final quotesBox = await Hive.openBox('favorite-quotes');
//     final quoteIds = quotesBox.keys;
//
//     print('quote keys:\n $quoteIds');
//
//     List<QuotesTable> allSavedQuotes = [];
//
//     quoteIds.map((found) => {
//       allSavedQuotes.add(quotesBox.get(found))
//     });
//
//     return allSavedQuotes;
//   }
//
//   @override
//   Future<void> markQuoteAsFavorite({QuotesTable table}) async {
//     final quotesBox = await Hive.openBox('favorite-quotes');
//     await quotesBox.put(table.id, table);
//   }
//
//   @override
//   Future<bool> checkIsFavorite({String quoteId}) async {
//     final quotesBox = await Hive.openBox('favorite-quotes');
//     return quotesBox.containsKey(quoteId);
//   }
//
//   @override
//   Future<QuotesTable> deleteQuoteAsFavorite({String quoteId}) async {
//     final quotesBox = await Hive.openBox('favorite-quotes');
//     await quotesBox.delete(quoteId);
//   }
//
// }