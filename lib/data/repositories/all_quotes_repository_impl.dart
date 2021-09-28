import 'package:flutter/material.dart';

import 'package:quotey/data/data_sources/quotes_remote_data_source.dart';
import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/domain/repositories/all_quotes_repository.dart';

class AllQuotesRepositoryImpl extends AllQuotesRepository {

  final QuotesRemoteDataSource dataSource;
  AllQuotesRepositoryImpl({@required this.dataSource});

  @override
  Future<List<QuotesModel>> getAllQuotes() async {
    return await dataSource.getAllQuotes();
  }

  @override
  Future<List<QuotesModel>> getQuotesInCategory({String categoryName}) async {
    return await dataSource.getQuotesInCategory(categoryName: categoryName);
  }

}