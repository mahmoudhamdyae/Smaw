import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smaw/core/resources/colors_manager.dart';

class FontsManager {

  static TextStyle heading2Bold({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.tajawal(
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? ColorsManager.black,
    );
  }

  static TextStyle heading3Bold({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.tajawal(
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? ColorsManager.black,
    );
  }

  static TextStyle heading4Bold({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.tajawal(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? ColorsManager.black,
    );
  }

  static TextStyle heading5({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.tajawal(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ColorsManager.black,
    );
  }

  static TextStyle heading5Bold({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.tajawal(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? ColorsManager.black,
    );
  }

  static TextStyle footnoteMedium({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? 13,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ColorsManager.black,
    );
  }

  static TextStyle captionS({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? 10,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ColorsManager.black,
    );
  }

  static TextStyle captionSBold({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? 10,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? ColorsManager.black,
    );
  }
}