import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/data/repositories/all_quotes_repository_impl.dart';
import 'package:quotey/data/repositories/category_repository_impl.dart';

import 'package:quotey/domain/repositories/all_quotes_repository.dart';
import 'package:quotey/domain/repositories/categories_repository.dart';

import 'package:quotey/presentation/blocs/all_quotes/all_quotes_bloc.dart';
import 'package:quotey/presentation/blocs/all_quotes/all_quotes_event.dart';

import 'package:quotey/presentation/blocs/categories/categories_bloc.dart';
import 'package:quotey/presentation/blocs/categories/categories_event.dart';

import 'package:quotey/presentation/blocs/category_quotes/category_quotes_bloc.dart';
import 'package:quotey/presentation/blocs/category_quotes/category_quotes_event.dart';

import 'package:quotey/presentation/journeys/landing.dart';

import 'package:quotey/utils/router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pedantic/pedantic.dart';

import 'di/get_it.dart' as getIt;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());

  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(QuotesModelAdapter());
  await Hive.openBox('favorite-quotes-box');

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
              // BlocProvider<CategoriesQuotesBloc>(
              //   create: (context){
              //     final repo = context.read<AllQuotesRepository>();
              //     return CategoriesQuotesBloc(repo)..add(GetQuotesInCategoryEvent());
              //   },
              // )
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
      onGenerateRoute: AppRouter.generateRoute,
      home: Landing(),
    );
  }
}