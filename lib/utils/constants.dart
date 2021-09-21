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
  )
);

var kSectionTitleTextStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    color: Color(0xFF1B1212),
    fontSize: 35.0,
    fontWeight: FontWeight.w500
  )
);

var kQuoteTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w600
    )
);

var kQuoteAuthorStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.w800
    )
);

var kCategoryTitleTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.w800
    )
);

var kEmptyFavoriteQuotesTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        fontSize: 25.0,
        fontWeight: FontWeight.w800
    )
);

var kLoadingTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        fontSize: 20.0,
        fontWeight: FontWeight.w800
    )
);

var kErrorTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
        fontWeight: FontWeight.w800
    )
);

/**
 *  Text Input Decors
 * **/

const loginInputDecors = InputDecoration(
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF616161), width: 1.0),
  ),
);
