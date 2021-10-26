import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/core/api_constants.dart';
import 'package:quotey/data/models/background_image_response_model.dart';
import 'package:quotey/data/models/background_images_model.dart';

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

  Color color = Colors.accents[Random().nextInt(Colors.accents.length)];

  final GlobalKey genKey = GlobalKey();

  final controller = ScreenshotController();

  final APIClient client = APIClient();
  var image;
  var response;

  @override
  void initState() {
    super.initState();
    image = APIConstants.PLACEHOLDER_IMAGE;
  }

  getBackgroundImage() async {
    response = await client.getRandomQuoteBackgroundImage();
    setState(() => image = BackgroundResponseModel.fromJson(response).urls.regular);
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () => {
          getBackgroundImage()
            },
        child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.72,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                  children: [
                    SizedBox( height: MediaQuery.of(context).size.height * .05, ),
                    Screenshot(
                      controller: controller,
                      child: Container(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.format_quote_sharp,
                                  color: Colors.white70.withOpacity(0.4),
                                  size: 60.0,
                                ),
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