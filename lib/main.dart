import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quotey/data/repositories/all_quotes_repository_impl.dart';
import 'package:quotey/data/repositories/category_repository_impl.dart';

import 'package:quotey/domain/repositories/all_quotes_repository.dart';
import 'package:quotey/domain/repositories/categories_repository.dart';

import 'package:quotey/presentation/blocs/all_quotes/all_quotes_bloc.dart';
import 'package:quotey/presentation/blocs/all_quotes/all_quotes_event.dart';
import 'package:quotey/presentation/blocs/categories/categories_bloc.dart';
import 'package:quotey/presentation/blocs/categories/categories_event.dart';

import 'package:quotey/presentation/journeys/landing.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

import 'data/core/api_client.dart';
import 'data/data_sources/categories_remote_data_source.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());

  // APIClient apiClient = APIClient();
  // CategoriesRemoteDataSource dataSource = CategoriesRemoteDataSourceImpl(client: apiClient);
  // dataSource.getAllCategories();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
      MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AllQuotesRepository>(
              create: (_)=> AllQuotesRepositoryImpl(dataSource: getIt.getItInstance()),
            ),
            RepositoryProvider<CategoriesRepository>(
              create: (_) => CategoryRepositoryImpl(dataSource: getIt.getItInstance()),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AllQuotesBloc>(
                create: (context) {
                  final repo = context.read<AllQuotesRepository>();
                  return AllQuotesBloc(repo)..add(GetAllQuotesEvent());
                },
              ),
              BlocProvider<CategoriesBloc>(
                create: (context){
                  final repo = context.read<CategoriesRepository>();
                  return CategoriesBloc(repo)..add(GetAllCategoriesEvent());
                },
              ),
            ],
            child: Quotey(),
          )
      )
  ));
}

class Quotey extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotey',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Landing()
    );
  }
}