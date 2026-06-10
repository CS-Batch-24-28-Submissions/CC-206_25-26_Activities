import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';

ThemeData catppuccinTheme(Flavor flavor) {
  Color primaryColor = flavor.sapphire;
  Color secondaryColor = flavor.yellow;
  return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
              color: flavor.text, fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: flavor.crust,
          foregroundColor: flavor.mantle),
      tabBarTheme: TabBarThemeData(
        labelColor: flavor.text,
        unselectedLabelColor: flavor.text.withValues(alpha: 0.6),
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: primaryColor, width: 2),
          ),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        error: flavor.surface2,
        onError: flavor.red,
        onPrimary: primaryColor,
        onSecondary: secondaryColor,
        onSurface: flavor.text,
        primary: flavor.crust,
        secondary: flavor.mantle,
        surface: flavor.surface0,
      ),
      textTheme: const TextTheme().apply(
        bodyColor: flavor.text,
        displayColor: primaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: flavor.crust,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      
      ));
}