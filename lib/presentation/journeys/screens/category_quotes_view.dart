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
import 'package:quotey/utils/constants.dart';

class CategoryQuotesView extends StatefulWidget {
  
  final String categoryName;
  CategoryQuotesView({@required this.categoryName});
  
  @override
  _CategoryQuotesViewState createState() => _CategoryQuotesViewState();
}

class _CategoryQuotesViewState extends State<CategoryQuotesView> {
  
  @override
  Widget build(BuildContext context) {
    print('cat-name ${widget.categoryName}');
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

class ItemsList extends StatefulWidget {

  final List<QuotesModel> quotes;
  ItemsList({@required this.quotes});

  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {

  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.quotes.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index){
        return Card(
          color: color,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: color,
            ),
            child: Stack(
              children: [
                Icon(
                  Icons.format_quote_sharp,
                  color: Colors.white70.withOpacity(0.4),
                  size: 350.0,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            onPressed: ()=>{},
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Text(
                        widget.quotes[index].content,
                        style: kQuoteTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45.0,
                              child: Divider(
                                color: Colors.white,
                                thickness: 2.0,
                                height: 1.5,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                widget.quotes[index].author,
                                textAlign: TextAlign.center,
                                style: kQuoteAuthorStyle,
                                overflow: TextOverflow.visible,
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(
                              width: 45.0,
                              child: Divider(
                                color: Colors.white,
                                thickness: 2.0,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
        );
      },
    );
  }
}