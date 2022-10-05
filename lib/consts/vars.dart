import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  topTrending,
  allNews,
}

enum SortByEmum {
  relevency,
  popularity,
  publishedAt,
}

TextStyle smallTextstyle = GoogleFonts.montserrat(fontSize: 15);

const List<String> searchKeyWords = [
  "Football",
  "Meta",
  "Bitcoin",
  "Netflix",
  "Python",
  "Flutter",
  "Youtube",
  "Ecommerce",
  "Hollywood"
];
