import 'package:flutter/material.dart';

import 'package:quotey/data/data_sources/authors_remote_data_source.dart';

import 'package:quotey/data/models/authors_model.dart';
import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/domain/repositories/authors_repository.dart';

class AuthorsRepositoryImpl extends AuthorsRepository {

  final AuthorsRemoteDataSource dataSource;
  AuthorsRepositoryImpl({@required this.dataSource});

  @override
  Future<List<AuthorsModel>> getAllAuthors() async {
    return await dataSource.getAllAuthors();
  }

  @override
  Future<List<QuotesModel>> getAuthorsQuotes({String authorSlug}) async {
    return await dataSource.getAuthorsQuotes(authorSlug: authorSlug);
  }

}