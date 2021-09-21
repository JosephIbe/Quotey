import 'package:get_it/get_it.dart';

import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/data_sources/quotey_remote_data_source.dart';
import 'package:quotey/data/repositories/all_quotes_repository_impl.dart';
import 'package:quotey/domain/repositories/all_quotes_repository.dart';

final getItInstance = GetIt.I;

Future init(){
  getItInstance.registerLazySingleton<APIClient>(() => APIClient());
  getItInstance.registerLazySingleton<QuoteyRemoteDataSource>(
          () => QuoteyRemoteDataSourceImpl(client: getItInstance()));
  getItInstance.registerLazySingleton<AllQuotesRepository>(
          () => AllQuotesRepositoryImpl(dataSource: getItInstance()));
}