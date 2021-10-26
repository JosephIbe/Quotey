import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:quotey/data/core/api_client.dart';

import 'package:quotey/data/models/quotes_model.dart';
import 'package:quotey/data/models/quotes_response_model.dart';

abstract class QuotesRemoteDataSource {
  Future<List<QuotesModel>> getAllQuotes({int page});
  Future<List<QuotesModel>> getQuotesInCategory({String categoryName});
  Future<bool> hasMorePages ({String pathSegment , int page});
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
  Future<bool> hasMorePages ({String pathSegment, int page}) async {
    final response = await client.get(path: pathSegment, page: page.toString());
    final totalPages = QuotesResponseModel.fromJson(response).totalPages;
    if (page < totalPages) {
      return true;
    } else if (page == totalPages) {
      return false;
    }
    return true;
  }

  @override
  Future<List<QuotesModel>> getQuotesInCategory({String categoryName}) async {
    final response = await client.getQuotesInCategory(path: '/quotes?tags=$categoryName');
    _allQuotes = QuotesResponseModel.fromJson(response).results;
    return _allQuotes;
  }
}