import 'package:flutter/material.dart';

import 'package:quotey/data/core/api_client.dart';

import 'package:quotey/data/models/quotes_model.dart';
import 'package:quotey/data/models/quotes_response_model.dart';

abstract class QuotesRemoteDataSource {
  Future<List<QuotesModel>> getAllQuotes({int page});
  Future<List<QuotesModel>> getQuotesInCategory({String categoryName, int page});
}

class QuotesRemoteDataSourceImpl extends QuotesRemoteDataSource {

  final APIClient client;
  QuotesRemoteDataSourceImpl({@required this.client});

  List<QuotesModel> _allQuotes = [];

  @override
  Future<List<QuotesModel>> getAllQuotes({int page}) async {
    final response = await client.get(path: '/quotes', page: page.toString());
    _allQuotes = QuotesResponseModel.fromJson(response).results;
    return _allQuotes;
  }

  @override
  Future<List<QuotesModel>> getQuotesInCategory({String categoryName, int page}) async {
    final response = await client.get(path: '/quotes?tags=$categoryName?page=$page');
    _allQuotes = QuotesResponseModel.fromJson(response).results;
    return _allQuotes;
  }
}