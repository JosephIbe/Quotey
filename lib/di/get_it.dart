import 'package:get_it/get_it.dart';

import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/data_sources/authors_remote_data_source.dart';

import 'package:quotey/data/data_sources/categories_remote_data_source.dart';
import 'package:quotey/data/data_sources/favorites_data_source.dart';
import 'package:quotey/data/data_sources/quotes_remote_data_source.dart';

import 'package:quotey/data/repositories/all_quotes_repository_impl.dart';
import 'package:quotey/data/repositories/authors_repository_impl.dart';
import 'package:quotey/data/repositories/category_repository_impl.dart';

import 'package:quotey/domain/repositories/all_quotes_repository.dart';
import 'package:quotey/domain/repositories/authors_repository.dart';
import 'package:quotey/domain/repositories/categories_repository.dart';

final getItInstance = GetIt.I;

Future<void> init(){
  getItInstance.registerLazySingleton<APIClient>(() => APIClient());

  getItInstance.registerLazySingleton<QuotesRemoteDataSource>(
          () => QuotesRemoteDataSourceImpl(client: getItInstance()));

  // getItInstance.registerLazySingleton<FavoritesDataSource>(
  //         () => FavoritesDataSourceImpl());

  getItInstance.registerLazySingleton<AllQuotesRepository>(
          () => AllQuotesRepositoryImpl(dataSource: getItInstance()));

  getItInstance.registerLazySingleton<CategoriesRemoteDataSource>(
          () => CategoriesRemoteDataSourceImpl(client: getItInstance()));

  getItInstance.registerLazySingleton<CategoriesRepository>(
          () => CategoryRepositoryImpl(dataSource: getItInstance()));

  getItInstance.registerLazySingleton<AuthorsRemoteDataSource>(
          () => AuthorsRemoteDataSourceImpl(client: getItInstance()));

  getItInstance.registerLazySingleton<AuthorsRepository>(
          () => AuthorsRepositoryImpl(dataSource: getItInstance()));

}