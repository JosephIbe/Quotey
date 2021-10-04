import 'dart:io';
import 'dart:ui' as ui;
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/utils/constants.dart';

import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toast/toast.dart';

class QuoteItem extends StatefulWidget {

  final QuotesModel quote;
  QuoteItem({@required this.quote});

  @override
  _QuoteItemState createState() => _QuoteItemState();
}

class _QuoteItemState extends State<QuoteItem> {

  Box box;
  Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  final GlobalKey genKey = GlobalKey();

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
          elevation: 4.0,
          shadowColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Container(
              margin: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height * 0.72,
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(
                                box.values.toList().contains(widget.quote.id) ? Icons.favorite : Icons.favorite_border,
                                color: box.values.toList().contains(widget.quote) ? Colors.red : Colors.white,
                                size: 40.0,
                              ),
                              onPressed: () => saveQuote(widget.quote),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        RepaintBoundary(
                            key: genKey,
                            child: Column(
                              children: [
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
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  )
                ],
              )
          ),
        )
    );

  }

  saveQuote(QuotesModel quoteToSave) async {
    if (!box.values.toList().contains(quoteToSave)) {
      box.put(quoteToSave.id, quoteToSave);

      if (box.values.toList().contains(quoteToSave)) {
        Toast.show(
          'Added to Favorites',
          context,
          gravity: Toast.CENTER,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.lightGreen
        );
      }

    }
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
        )
      ),
      builder: (context) {
        return Container(
          height: 180.0,
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              ListTile(
                  onTap: ()=> copyToClipBoard(context, quote),
                  title: Row(
                    children: [
                      Icon(Icons.copy, color: Colors.white),
                      SizedBox(width: 20.0,),
                      Text('Copy Text', style: kBottomSheetTextStyle,),
                    ],
                  )
              ),
              // ListTile(
              //   onTap: ()=>{},
              //   title: Row(
              //     children: [
              //       Icon(Icons.share, color: Colors.white),
              //       SizedBox(width: 20.0,),
              //       Text('Share As Text', style: kBottomSheetTextStyle,),
              //     ],
              //   ),
              // ),
              ListTile(
                onTap: ()=> takeQuotePicture(quote),
                title: Row(
                  children: [
                    Icon(Icons.share, color: Colors.white),
                    SizedBox(width: 20.0,),
                    Text('Share As Image', style: kBottomSheetTextStyle,),
                  ],
                ),
              ),
              ListTile(
                onTap: ()=>{},
                title: Row(
                  children: [
                    Icon(Icons.download_sharp, color: Colors.white),
                    SizedBox(width: 20.0,),
                    Text('Download', style: kBottomSheetTextStyle,),
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

    RenderRepaintBoundary boundary = genKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();

    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();

    File imgFile = File('$directory/${quote.content.substring(0, 10)} + photo.png');
    await imgFile.writeAsBytes(pngBytes);

    Share.shareFiles([imgFile.path.toString()]);

    print(imgFile.path);

    Navigator.pop(context);

  }

}