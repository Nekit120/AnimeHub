import 'package:anime_hub/theme/theme_colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: LightThemeColors.mdThemeLightPrimary,
      onPrimary: LightThemeColors.mdThemeLightOnPrimary,
      secondary: LightThemeColors.mdThemeLightOnSecondary,
      onSecondary: LightThemeColors.mdThemeLightOnSecondary,
      background: LightThemeColors.mdThemeLightBackground,
      onBackground: LightThemeColors.mdThemeLightOnBackground,
      surface: LightThemeColors.mdThemeLightSurface,
      onSurface: LightThemeColors.mdThemeLightShadow, //2242
      error: LightThemeColors.mdThemeLightError,
      onError: LightThemeColors.mdThemeLightOnError,
      primaryContainer: LightThemeColors.mdThemeLightPrimaryContainer,
      onPrimaryContainer: LightThemeColors.mdThemeLightOnPrimaryContainer,
      secondaryContainer: LightThemeColors.mdThemeLightSecondaryContainer,
      onSecondaryContainer: LightThemeColors.mdThemeLightOnSecondaryContainer,
      tertiary: LightThemeColors.mdThemeLightTertiary,
      onTertiary: LightThemeColors.mdThemeLightOnTertiary,
      tertiaryContainer: LightThemeColors.mdThemeLightTertiaryContainer,
      onTertiaryContainer: LightThemeColors.mdThemeLightOnTertiaryContainer,
      errorContainer: LightThemeColors.mdThemeLightErrorContainer,
      onErrorContainer: LightThemeColors.mdThemeLightOnErrorContainer,
      surfaceVariant: LightThemeColors.mdThemeLightSurfaceVariant,
      onSurfaceVariant: LightThemeColors.mdThemeLightOnSurfaceVariant,
      outline: LightThemeColors.mdThemeLightOutline,
    ),
  navigationBarTheme: const NavigationBarThemeData(
      surfaceTintColor: LightThemeColors.mdThemeLightPrimary ,
      indicatorColor: LightThemeColors.mdThemeLightSecondaryTwoContainer
  ),
  dropdownMenuTheme:
      const DropdownMenuThemeData(inputDecorationTheme: InputDecorationTheme()),
  inputDecorationTheme: const InputDecorationTheme(
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    prefixIconColor: Color(0xFF81737A),
    suffixIconColor: Color(0xFF81737A),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    padding: EdgeInsets.zero,
  )),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 57,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -.25),
    displayMedium: TextStyle(
      fontSize: 45,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      height: 52 / 45,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      height: 44 / 36,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      height: 40 / 32,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      height: 36 / 28,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      height: 32 / 24,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      height: 28 / 22,
    ),
    titleMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: .15),
    titleSmall: TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      height: 20 / 14,
      letterSpacing: .1,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      height: 20 / 14,
      letterSpacing: .1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      color: LightThemeColors.mdThemeLightOnSurfaceVariant,
      height: 16 / 12,
      letterSpacing: .5,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      height: 16 / 11,
      letterSpacing: .5,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: .5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      color: LightThemeColors.mdThemeLightOnSurfaceVariant,
      height: 20 / 14,
      letterSpacing: .25,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
    //  fontFamily: 'Italic', // Убедитесь, что у вас есть шрифт 'Italic' в вашем проекте
      fontWeight: FontWeight.w400,
      height: 16 / 12,
      letterSpacing: 0.4,
    )
  ),
  //dividerColor: LightThemeColors.outlineVariantColorNV80,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: LightThemeColors.mdThemeLightOnSurfaceVariant,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Color(0xFF81737A)),
);
