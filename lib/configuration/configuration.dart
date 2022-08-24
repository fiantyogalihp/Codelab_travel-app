import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color transparent = Colors.transparent;

const FontWeight bold = FontWeight.bold;
const FontWeight normal = FontWeight.normal;
const FontWeight medium = FontWeight.w500;

TextStyle montserratMedium({required Color color, required double size}) =>
    GoogleFonts.montserrat(
        fontWeight: FontWeight.w500, fontSize: size, color: color);

TextStyle montserratNormal({required Color color, required double size}) =>
    GoogleFonts.montserrat(
        fontWeight: FontWeight.normal, fontSize: size, color: color);

TextStyle montserratBold({required Color color, required double size}) =>
    GoogleFonts.montserrat(
        fontWeight: FontWeight.w700, fontSize: size, color: color);

Widget addVertivalSpace(double height) => SizedBox(
      height: height,
    );

Widget addHorizontalSpace(double width) => SizedBox(
      width: width,
    );
