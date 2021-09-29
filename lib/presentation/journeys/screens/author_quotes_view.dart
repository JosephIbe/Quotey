import 'dart:math';

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