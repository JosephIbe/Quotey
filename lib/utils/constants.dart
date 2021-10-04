import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 *  Font Styles
 * **/

var kAppNameTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
  color: Color(0xFF1B1212),
  fontWeight: FontWeight.w800,
  fontSize: 30.0,
));

var kSectionTitleTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
        color: Color(0xFF1B1212), fontSize: 35.0, fontWeight: FontWeight.w500));

var kQuoteTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600));

var kQuoteAuthorStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w800));

var kCategoryTitleTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w800));

var kEmptyFavoriteQuotesTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        fontSize: 25.0,
        fontWeight: FontWeight.w800));

var kLoadingTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        fontSize: 20.0,
        fontWeight: FontWeight.w800));

var kErrorTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
        color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.w800));

var kQuoteTagTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
  color: Colors.white70,
  fontSize: 15.0,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
));

var kSettingsCardTitleTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
  color: Colors.black54,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
));

var kPolicyHeaderTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
  color: Colors.black,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
));

var kPolicyBodyTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
  color: Colors.black,
  fontSize: 13.0,
  fontWeight: FontWeight.w400,
));

var kAboutAppNameTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold));

var kAppVersionTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
  color: Colors.white,
));

var kBottomSheetTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold
  )
);