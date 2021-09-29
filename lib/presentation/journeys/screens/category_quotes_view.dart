import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/data/repositories/all_quotes_repository_impl.dart';

import 'package:quotey/presentation/blocs/category_quotes/category_quotes_bloc.dart';
import 'package:quotey/presentation/blocs/category_quotes/category_quotes_event.dart';
import 'package:quotey/presentation/blocs/category_quotes/category_quotes_state.dart';

import 'package:quotey/presentation/widgets/app_loader.dart';
import 'package:quotey/presentation/widgets/failure_widget.dart';

import 'package:quotey/di/get_it.dart' as getIt;
import 'package:quotey/presentation/widgets/quote_item.dart';

class CategoryQuotesView extends StatefulWidget {
  
  final String categoryName;
  CategoryQuotesView({@required this.categoryName});
  
  @override
  _CategoryQuotesViewState createState() => _CategoryQuotesViewState();
}

class _CategoryQuotesViewState extends State<CategoryQuotesView> {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesQuotesBloc>(
      create: (context) => CategoriesQuotesBloc(getIt.getItInstance())
        ..add(GetQuotesInCategoryEvent(categoryName: widget.categoryName)),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CategoryQuotesListView(categoryName: widget.categoryName),
      )
    );
  }

}

class CategoryQuotesListView extends StatelessWidget {

  final String categoryName;
  CategoryQuotesListView({@required this.categoryName});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            categoryName,
            style: TextStyle(color: Colors.primaries[Random().nextInt(Colors.primaries.length)],),
          ),
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
        ),
        body: BlocBuilder<CategoriesQuotesBloc, CategoryQuotesState>(
          builder: (context, state){
            if (state is CategoryQuotesStateStateLoading) {
              return AppLoader(text: 'Getting Your Quotes Ready...');
            }
            if (state is CategoryQuotesStateSuccess) {
              return ItemsList(quotes: state.quotesList);
            }
            if (state is CategoryQuotesStateFailure) {
              return FailureWidget(reason: 'The Meditating Philosopher Should Not Be Disturbed');
            }
            return AppLoader(text: 'Getting Your Quotes Ready...');
          },
        ),
      ),
    );
  }
}

class ItemsList extends StatelessWidget {

  final List<QuotesModel> quotes;
  ItemsList({@required this.quotes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index){
        return QuoteItem(quote: quotes[index]);
      },
    );
  }

}