import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() => _buildTheme(
    primary: const Color(0xFF6F60EF),
    secondary: const Color(0xFF45d2c0),
    brightness: Brightness.light,
  );

  static ThemeData dark() => _buildTheme(
    primary: const Color(0xFF6F60EF),
    secondary: const Color(0xFF45d2c0),
    brightness: Brightness.dark,
  );

  static ThemeData _buildTheme({
    required Color primary,
    required Color secondary,
    required Brightness brightness,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
      secondary: secondary,
    ).copyWith(primary: primary, secondary: secondary);

    final baseTheme = ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary.withAlpha(30),
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      dataTableTheme: DataTableThemeData(
        headingRowColor: WidgetStateProperty.all(colorScheme.primary),
        headingTextStyle: TextStyle(
          color: colorScheme.surface,
          fontWeight: FontWeight.w600,
        ),
        headingRowHeight: 40,
      ),
      cardTheme: const CardTheme(clipBehavior: Clip.antiAlias),
      useMaterial3: true,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onSurface,
      ),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}
