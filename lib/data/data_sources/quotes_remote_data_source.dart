import 'package:flutter/material.dart';

import 'package:quotey/data/core/api_client.dart';

import 'package:quotey/data/models/quotes_model.dart';
import 'package:quotey/data/models/quotes_response_model.dart';

abstract class QuotesRemoteDataSource {
  Future<List<QuotesModel>> getAllQuotes();
}

class QuotesRemoteDataSourceImpl extends QuotesRemoteDataSource {

  final APIClient client;
  QuotesRemoteDataSourceImpl({@required this.client});

  List<QuotesModel> _allQuotes = [];

  @override
  Future<List<QuotesModel>> getAllQuotes() async {
    final response = await client.get(path: '/quotes');
    _allQuotes = QuotesResponseModel.fromJson(response).results;
    return _allQuotes;
  }
}