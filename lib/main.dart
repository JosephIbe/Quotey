import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/data/repositories/all_quotes_repository_impl.dart';
import 'package:quotey/data/repositories/authors_repository_impl.dart';
import 'package:quotey/data/repositories/category_repository_impl.dart';

import 'package:quotey/data/tables/quotes_table.dart';

import 'package:quotey/domain/repositories/all_quotes_repository.dart';
import 'package:quotey/domain/repositories/authors_repository.dart';
import 'package:quotey/domain/repositories/categories_repository.dart';

import 'package:quotey/presentation/blocs/all_quotes/all_quotes_bloc.dart';
import 'package:quotey/presentation/blocs/all_quotes/all_quotes_event.dart';
import 'package:quotey/presentation/blocs/authors/authors_bloc.dart';
import 'package:quotey/presentation/blocs/authors/authors_event.dart';
import 'package:quotey/presentation/blocs/categories/categories_bloc.dart';
import 'package:quotey/presentation/blocs/categories/categories_event.dart';

import 'package:quotey/presentation/journeys/landing.dart';
import 'package:quotey/presentation/themes/app_colors.dart';

import 'package:quotey/utils/router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());

  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  // Hive.registerAdapter(QuotesModelAdapter());
  Hive.registerAdapter(QuotesTableAdapter());
  await Hive.openBox<QuotesModel>('favorite-quotes');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MultiRepositoryProvider(
              providers: [
                RepositoryProvider<AllQuotesRepository>(
                  create: (_) => AllQuotesRepositoryImpl(
                      dataSource: getIt.getItInstance()),
                ),
                RepositoryProvider<CategoriesRepository>(
                  create: (_) =>
                      CategoryRepositoryImpl(dataSource: getIt.getItInstance()),
                ),
                RepositoryProvider<AuthorsRepository>(
                  create: (_) =>
                      AuthorsRepositoryImpl(dataSource: getIt.getItInstance()),
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
                    create: (context) {
                      final repo = context.read<CategoriesRepository>();
                      return CategoriesBloc(repo)..add(GetAllCategoriesEvent());
                    },
                  ),
                  BlocProvider<AuthorsBloc>(
                    create: (context) {
                      final repo = context.read<AuthorsRepository>();
                      return AuthorsBloc(repo)..add(GetAllAuthorsEvent());
                    },
                  ),
                ],
                child: Quotey(),
              )
            )
          )
      );
}

class Quotey extends StatelessWidget {

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotey',
      // theme: ThemeData(
      //   primarySwatch: AppColors.milk,
      //   scaffoldBackgroundColor: AppColors.milk,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      onGenerateRoute: AppRouter.generateRoute,
      home: Landing(),
    );
  }
}