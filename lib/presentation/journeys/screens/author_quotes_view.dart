import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotey/data/models/authors_model.dart';

import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/presentation/blocs/author_quotes/author_quotes_bloc.dart';
import 'package:quotey/presentation/blocs/author_quotes/author_quotes_event.dart';
import 'package:quotey/presentation/blocs/author_quotes/author_quotes_state.dart';

import 'package:quotey/presentation/widgets/app_loader.dart';
import 'package:quotey/presentation/widgets/failure_widget.dart';
import 'package:quotey/presentation/widgets/quote_item.dart';

import 'package:quotey/di/get_it.dart' as getIt;

class AuthorQuotesView extends StatelessWidget {

  final AuthorsModel author;
  AuthorQuotesView({@required this.author});

  @override
  Widget build(BuildContext context) {

    return BlocProvider<AuthorQuotesBloc>(
        create: (context) => AuthorQuotesBloc(getIt.getItInstance())
          ..add(GetQuotesByAuthorEvent(authorSlug: author.slug)),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: AuthorQuotesList(author: author),
        )
    );
  }
}


class AuthorQuotesList extends StatelessWidget {

  final AuthorsModel author;
  AuthorQuotesList({@required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          author.name,
          style: TextStyle(color: Colors.primaries[Random().nextInt(Colors.primaries.length)],),
        ),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            padding: EdgeInsets.all(5.0),
            onPressed: ()=> openAuthorBioDialog(context, author),
            icon: Icon(Icons.info_outline, color: Colors.green,),
          )
        ],
      ),
      body: BlocBuilder<AuthorQuotesBloc, AuthorQuotesState>(
        builder: (context, state){
          if (state is AuthorQuotesStateLoading) {
            return AppLoader(text: 'Getting Quotes By ${author.name} Ready...');
          }
          if (state is AuthorQuotesStateSuccess) {
            return ItemsList(quotes: state.quotesList);
          }
          if (state is AuthorQuotesStateFailure) {
            return FailureWidget(reason: 'The Meditating Philosopher Should Not Be Disturbed');
          }
          return AppLoader(text: 'Getting Quotes By ${author.name} Ready...');
        },
      ),
    );
  }

  openAuthorBioDialog(BuildContext context, AuthorsModel author) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
            title: Text('A Brief on ${author.name}'),
            content: AnimatedContainer(
              padding: EdgeInsets.all(10.0),
              duration: Duration(milliseconds: 800),
              constraints: BoxConstraints(
                minHeight: 200.0,
                maxWidth: 300.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.blueGrey, width: 1.0),
                )
              ),
              child: Text(
                author.bio.toString(),
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')
              ),
            ],
        );
      }
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