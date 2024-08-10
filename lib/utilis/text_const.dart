import 'package:flutter/material.dart';

class TextStyles {
  static const String fontFamily = 'Roboto';

  // Heading (e.g., Recipe Title)
  static TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Subheading (e.g., Section Titles)
  static TextStyle subheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white.withOpacity(0.87),
  );

  // Title (e.g., Ingredients, Instructions Titles)
  static TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(1),
  );

  // Content (e.g., Description, Ingredient List)
  static TextStyle content = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white.withOpacity(0.70),
  );

  // Subtitle (e.g., Time, Servings)
  static TextStyle subtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(0.70),
  );

  // Caption (e.g., Footnotes, Small Labels)
  static TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.white.withOpacity(0.60),
  );
}
