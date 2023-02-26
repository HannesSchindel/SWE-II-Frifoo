import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Global constants are declared here

const double WIDTH_DIVIDER = 1.2; // ensures evenly spaced side-gaps
const double MAIN_CONTAINER_MARGIN = 30.0;

// Colors:
const Color DARK_GREEN = Color(0xff55A38F);
const Color LIGHT_GREEN = Color(0xff47D65E);

// Fonts:
final TextStyle FONT_LOGO_HEADING = GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white);
final TextStyle FONT_LOGO_BLACK_HEADING = GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black);
final TextStyle FONT_FIRST_HEADING = GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black);
final TextStyle FONT_SECOND_HEADING = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);
final TextStyle FONT_SECOND_WHITE_HEADING = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
final TextStyle FONT_PARAGRAPH = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);