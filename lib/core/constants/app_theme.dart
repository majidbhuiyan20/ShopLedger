import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3:     true,
    colorScheme:      _colorScheme,
    scaffoldBackgroundColor: AppColors.bgBase,
    fontFamily:       'Inter',
    appBarTheme:      _appBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    dividerTheme:     const DividerThemeData(color: AppColors.borderDefault, thickness: 1),
  );

  static const ColorScheme _colorScheme = ColorScheme(
    brightness:    Brightness.light,
    primary:       AppColors.primary,
    onPrimary:     AppColors.textOnPrimary,
    secondary:     AppColors.success,
    onSecondary:   AppColors.textOnPrimary,
    error:         AppColors.danger,
    onError:       AppColors.textOnPrimary,
    surface:       AppColors.bgBase,
    onSurface:     AppColors.textPrimary,
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor:    AppColors.bgBase,
    foregroundColor:    AppColors.textPrimary,
    elevation:          0,
    scrolledUnderElevation: 0,
    centerTitle:        false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:           Colors.transparent,
      statusBarIconBrightness:  Brightness.dark,
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:  AppColors.primary,
      foregroundColor:  AppColors.textOnPrimary,
      minimumSize:      const Size(double.infinity, 54),
      shape:            RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation:        0,
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor:  AppColors.primary,
      minimumSize:      const Size(double.infinity, 54),
      shape:            RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      side: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
  );

  static final InputDecorationTheme _inputDecorationTheme =
  InputDecorationTheme(
    filled:           true,
    fillColor:        AppColors.bgSurface,
    contentPadding:   const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border:           OutlineInputBorder(
      borderRadius:   BorderRadius.circular(12),
      borderSide:     const BorderSide(color: AppColors.borderDefault),
    ),
    enabledBorder:    OutlineInputBorder(
      borderRadius:   BorderRadius.circular(12),
      borderSide:     const BorderSide(color: AppColors.borderDefault),
    ),
    focusedBorder:    OutlineInputBorder(
      borderRadius:   BorderRadius.circular(12),
      borderSide:     const BorderSide(color: AppColors.borderFocused, width: 1.5),
    ),
    errorBorder:      OutlineInputBorder(
      borderRadius:   BorderRadius.circular(12),
      borderSide:     const BorderSide(color: AppColors.borderError),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius:   BorderRadius.circular(12),
      borderSide:     const BorderSide(color: AppColors.borderError, width: 1.5),
    ),
  );
}