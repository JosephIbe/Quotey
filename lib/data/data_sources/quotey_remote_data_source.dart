import 'package:flutter/material.dart';
import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/models/quotes_model.dart';
import 'package:quotey/data/models/quotes_response_model.dart';

abstract class QuoteyRemoteDataSource {
  Future<List<QuotesModel>> getAllQuotes();
}

class QuoteyRemoteDataSourceImpl extends QuoteyRemoteDataSource {

  final APIClient client;
  QuoteyRemoteDataSourceImpl({@required this.client});

  List<QuotesModel> _allQuotes = [];

  @override
  Future<List<QuotesModel>> getAllQuotes() async {
    final response = await client.getAllQuotes();
    print('qrds response\n$response');
    _allQuotes = QuotesResponseModel.fromJson(response).results;
    print('all-quotes:\n ${_allQuotes.first}');
    // print(quotes);
    return _allQuotes;
  }
}