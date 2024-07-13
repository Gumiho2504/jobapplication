import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF1E1E9C);
const secondaryColors = Color(0xFF0B47AF);
const accentColor = Color(0xFFF9FAFC);
const darkAccentcolor = Color(0xFF9F9F9F);
const secondAccentColors = Color(0xFFB9BCC8);
const backgroundColor = Colors.white;

var headline1 = GoogleFonts.poppins(
    color: secondaryColors, fontWeight: FontWeight.w600, fontSize: 25.h);

var headline2 = GoogleFonts.poppins(
    color: backgroundColor, fontWeight: FontWeight.w400, fontSize: 18.h);
var headline2_black = GoogleFonts.poppins(
    color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18.h);

var headline3 = GoogleFonts.poppins(
    color: backgroundColor, fontWeight: FontWeight.w500, fontSize: 20.h);
var headline3_black = GoogleFonts.poppins(
    color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.h);

var bodyText1 = GoogleFonts.poppins(
    color: secondAccentColors, fontSize: 16.h, fontWeight: FontWeight.w400);

var bodyText2 = GoogleFonts.poppins(
    color: secondAccentColors, fontSize: 14.h, fontWeight: FontWeight.w400);
