import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.poppins(
        
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
        decoration: decoration,
        fontStyle: fontStyle,
      ),
    );
  }
}