import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/core/api_constants.dart';

import 'package:quotey/data/models/background_image_response_model.dart';
import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/presentation/widgets/animated_heart.dart';

import 'package:quotey/utils/constants.dart';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toast/toast.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    image = APIConstants.PLACEHOLDER_IMAGE;
  }

  getBackgroundImage() async {
    var response = await client.getRandomQuoteBackgroundImage();
    setState(() => image = BackgroundResponseModel.fromJson(response).urls.regular);
    print(image);
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () => { getBackgroundImage() },
        // onDoubleTap: ()=> addQuoteToFavorites(context, widget.quote,),
        onLongPress: ()=> openSheet(context, widget.quote),
          child: Card(
            elevation: 4.0,
            margin: EdgeInsets.all(5.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Screenshot(
                    controller: controller,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                            imageUrl: image,
                            imageBuilder: (context, imageProvider) => Container(
                              height: MediaQuery.of(context).size.height * 0.72,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              height: MediaQuery.of(context).size.height * 0.72,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.purple,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                              ),
                            ),
                            errorWidget: (context, url, error) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.error, color: Colors.redAccent,),
                                SizedBox(height: 10.0,),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150.0,
                                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  child: Text('Possible Network Error in Loading Image, Tap to Try Again', style: kErrorTextStyle, textAlign: TextAlign.center,),
                                )
                              ],
                            )
                        ),
                        Column(
                            children: [
                              SizedBox( height: MediaQuery.of(context).size.height * .05, ),
                              Container(
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
                                        Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            widget.quote.content ?? 'Empty Quote',
                                            style: kQuoteTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
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
                            ]
                        ),
                        Center(
                            child: Opacity(
                              opacity: isAnimating ? 1.0 : 0.0,
                              child: AnimatedHeart(
                                  isAnimating: isAnimating,
                                  child: Icon(Icons.favorite_outlined, size: 160.0, color: Colors.redAccent,),
                                  duration: Duration(milliseconds: 1500),
                                  onAnimationEnd: ()=> setState(() => isAnimating = false)
                              ),
                            )
                        ),
                      ],
                    ),
                  )
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

              Share.shareFiles([imgFile.path.toString()]);
    });

    Navigator.pop(context);
  }

  shareQuoteAsText(QuotesModel quote) {
    Share.share(
      quote.content,
      subject: 'Check out this quote from this author:\t ${quote.author} in this category ${quote.tags}'
    );

    Navigator.pop(context);
  }

  addQuoteToFavorites(BuildContext context, QuotesModel quote) {
    setState(() => isAnimating = true);
  }

}