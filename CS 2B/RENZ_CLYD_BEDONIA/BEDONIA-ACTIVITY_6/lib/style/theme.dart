import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color appGreen = Color.fromARGB(255, 28, 139, 0);

  static ThemeData get lightTheme {
    return ThemeData(
      // Color Theme
      colorScheme: ColorScheme.fromSeed(seedColor: appGreen),
      scaffoldBackgroundColor: Colors.white,

      // Text Theme
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.geom(fontSize: 28),
        titleLarge: GoogleFonts.geom(fontSize: 22),
        bodyMedium: GoogleFonts.roboto(fontSize: 16),
        bodySmall: GoogleFonts.roboto(fontSize: 14),
        labelLarge: GoogleFonts.roboto(fontSize: 14),
      ),

      // TabBar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: appGreen,
        unselectedLabelColor: Colors.grey,
        indicatorColor: appGreen,
        overlayColor: WidgetStatePropertyAll(appGreen.withOpacity(0.1)),
        labelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.normal),
      ),
    );
  }
}
