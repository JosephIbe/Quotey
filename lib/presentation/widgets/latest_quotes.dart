import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotey/data/models/quotes_model.dart';
import 'package:quotey/presentation/blocs/all_quotes/all_quotes_bloc.dart';
import 'package:quotey/presentation/blocs/all_quotes/all_quotes_state.dart';

import 'app_loader.dart';
import 'failure_widget.dart';
import 'quote_item.dart';

class LatestQuotes extends StatefulWidget {
  @override
  _LatestQuotesState createState() => _LatestQuotesState();
}

class _LatestQuotesState extends State<LatestQuotes> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: 450.0,
          minHeight: 420.0,
        ),
        child: BlocBuilder<AllQuotesBloc, AllQuotesState>(
          builder: (context, state) {
            if (state is AllQuotesStateLoading) {
              return AppLoader(text: 'Fetching Data');
            }
            if (state is AllQuotesStateSuccess) {
              return QuotesList(quotes: state.quotesList);
            }
            if(state is AllQuotesStateFailure) {
              return FailureWidget(reason: state.errorMessage ?? 'Could not process your request');
            }
            return AppLoader(text: 'Care For a ""? ');
          },
        )
    );
  }

}

class QuotesList extends StatefulWidget {

  final List<QuotesModel> quotes;
  QuotesList({@required this.quotes});

  @override
  _QuotesListState createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {

  var controller = PageController();

  @override
  void initState() {
    super.initState();
    controller = PageController(
      viewportFraction: 0.75,
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.quotes.length,
      controller: controller,
      reverse: false,
      pageSnapping: true,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: QuoteItem(
          text: widget.quotes[index].content,
          author: widget.quotes[index].author
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}