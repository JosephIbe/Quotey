import 'dart:math';

import 'package:flutter/material.dart';

import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/utils/constants.dart';

import 'package:hive/hive.dart';

class QuoteItem extends StatefulWidget {
  final QuotesModel quote;

  QuoteItem({@required this.quote});

  @override
  _QuoteItemState createState() => _QuoteItemState();
}

class _QuoteItemState extends State<QuoteItem> {
  Box box;
  Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {

    box = Hive.box<QuotesModel>('favorite-quotes');

    return GestureDetector(
        onTap: () => {
              setState(() => color =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)])
            },
        child: Card(
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(
                                box.values.toList().contains(widget.quote) ? Icons.favorite : Icons.favorite_border,
                                color: box.values.toList().contains(widget.quote) ? Colors.red : Colors.white,
                                size: 40.0,
                              ),
                              onPressed: () => {},
                              // onPressed: () => saveQuote(widget.quote),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Text(
                          widget.quote.content,
                          style: kQuoteTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 25.0,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 2.0,
                                  height: 1.5,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.quote.author,
                                  textAlign: TextAlign.center,
                                  style: kQuoteAuthorStyle,
                                  overflow: TextOverflow.visible,
                                  maxLines: 3,
                                ),
                              ),
                              SizedBox(
                                width: 25.0,
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
        )
    );
    //
    GestureDetector(
      onTap: () => {
        setState(() =>
            color = Colors.primaries[Random().nextInt(Colors.primaries.length)])
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 300.0,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          child: Stack(
            children: [
              Icon(
                Icons.format_quote_sharp,
                color: Colors.white70.withOpacity(0.4),
                size: 290.0,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
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
                        onPressed: () => saveQuote(widget.quote),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                    widget.quote.content,
                    style: kQuoteTextStyle,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25.0,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2.0,
                          height: 1.5,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.quote.author,
                          textAlign: TextAlign.center,
                          style: kQuoteAuthorStyle,
                          overflow: TextOverflow.visible,
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2.0,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }

  saveQuote(QuotesModel quoteToSave) async {
    if (!box.values.toList().contains(quoteToSave)) {
      box.add(quoteToSave);
    }
  }
}
