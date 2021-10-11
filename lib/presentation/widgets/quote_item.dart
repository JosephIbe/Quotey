import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/utils/constants.dart';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toast/toast.dart';

class QuoteItem extends StatefulWidget {
  final QuotesModel quote;

  QuoteItem({@required this.quote});

  @override
  _QuoteItemState createState() => _QuoteItemState();
}

class _QuoteItemState extends State<QuoteItem> {

  Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  final GlobalKey genKey = GlobalKey();

  final controller = ScreenshotController();

  var isQuotePlaying;

  @override
  void initState() {
    super.initState();
    isQuotePlaying = false;
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () => {
              setState(() => color =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)])
            },
        child: Card(
            color: color,
            elevation: 4.0,
            shadowColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(5.0),
              height: MediaQuery.of(context).size.height * 0.72,
              decoration: BoxDecoration(
                color: color,
              ),
              child: Column(
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
                      onPressed: () => {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      onPressed: () => openSheet(context, widget.quote),
                    ),
                  ],
                ),
                    SizedBox( height: MediaQuery.of(context).size.height * .05, ),
                    Screenshot(
                      controller: controller,
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                        ),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.format_quote_sharp,
                              color: Colors.white70.withOpacity(0.4),
                              size: 290.0,
                            ),
                            Column(
                              children: [
                                SizedBox(height: 20.0,),
                                Text(
                                  widget.quote.content ?? 'Empty Quote',
                                  style: kQuoteTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .08,
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
                                          widget.quote.author ?? 'Unknown Author',
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
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
            ),

            )
        )
    );
  }

  openSheet(BuildContext context, QuotesModel quote) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      elevation: 4.0,
      backgroundColor: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(15.0),
        topLeft: Radius.circular(15.0),
      )),
      builder: (context) {
        return Container(
          height: 200.0,
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              ListTile(
                  onTap: () => copyToClipBoard(context, quote),
                  title: Row(
                    children: [
                      Icon(Icons.copy, color: Colors.white),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Copy Text',
                        style: kBottomSheetTextStyle,
                      ),
                    ],
                  )),
              ListTile(
                onTap: ()=> shareQuoteAsText(quote),
                title: Row(
                  children: [
                    Icon(Icons.share, color: Colors.white),
                    SizedBox(width: 20.0,),
                    Text('Share As Text', style: kBottomSheetTextStyle,),
                  ],
                ),
              ),
              ListTile(
                onTap: () => takeQuotePicture(quote),
                title: Row(
                  children: [
                    Icon(Icons.share, color: Colors.white),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Share As Image',
                      style: kBottomSheetTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> copyToClipBoard(BuildContext context, QuotesModel quote) async {
    await Clipboard.setData(ClipboardData(text: quote.content));

    Toast.show(
      'Quote Copied',
      context,
      gravity: Toast.CENTER,
      duration: Toast.LENGTH_LONG,
      backgroundColor: Colors.green,
    );

    Navigator.pop(context);
  }

  Future<void> takeQuotePicture(QuotesModel quote) async {

    controller.capture(pixelRatio: 2.5, delay: const Duration(milliseconds: 10))
              .then((Uint8List image) async {

              final directory = await (getApplicationDocumentsDirectory());
              String path = directory.path;
              File imgFile = File('$path/${quote.content.substring(0, 10)} + photo.png');
              await imgFile.writeAsBytes(image);
              //
              Share.shareFiles([imgFile.path.toString()]);
    });

    Navigator.pop(context);
  }

  shareQuoteAsText(QuotesModel quote) {
    Share.share(
      quote.content,
      subject: 'Check out this quote from this author:\t ${quote.author} in this category ${quote.tags}'
    );
  }

}