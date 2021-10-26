import 'package:flutter/material.dart';
import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/models/AuthorsResponseModel.dart';
import 'package:quotey/data/models/authors_model.dart';
import 'package:quotey/data/models/quotes_model.dart';
import 'package:quotey/data/models/quotes_response_model.dart';

abstract class AuthorsRemoteDataSource {
  Future<List<AuthorsModel>> getAllAuthors({int page});
  Future<List<QuotesModel>> getAuthorsQuotes({String authorSlug});
  Future<bool> hasMorePages ({int page});
}

class AuthorsRemoteDataSourceImpl extends AuthorsRemoteDataSource {

  final APIClient client;
  AuthorsRemoteDataSourceImpl({@required this.client});

  List<AuthorsModel> _allAuthors = [];
  List<QuotesModel> _allAuthorQuotes = [];

  @override
  Future<List<AuthorsModel>> getAllAuthors({int page}) async {
    final response = await client.get(path: '/authors', page: page.toString());
    _allAuthors = AuthorsResponseModel.fromJson(response).results;
    return _allAuthors.length == 0 ? null : _allAuthors;
  }

  @override
  Future<List<QuotesModel>> getAuthorsQuotes({String authorSlug}) async {
    final response = await client.get(path: '/quotes?author=$authorSlug');
    _allAuthorQuotes = QuotesResponseModel.fromJson(response).results;
    return _allAuthorQuotes;
  }

  @override
  Future<bool> hasMorePages({String pathSegment, int page}) async {
    final response = await client.get(path: '/authors', page: page.toString());
    final totalPages = AuthorsResponseModel.fromJson(response).totalPages;
    if (page < totalPages) {
      return true;
    } else if (page == totalPages) {
      return false;
    }
    return true;
  }

}