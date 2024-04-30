import 'package:anime_hub/theme/theme_colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: LightThemeColors.mdThemeLightPrimary,
      onPrimary: LightThemeColors.mdThemeLightOnPrimary,
      secondary: LightThemeColors.mdThemeLightSecondary,
      onSecondary: LightThemeColors.mdThemeLightOnSecondary,
      background: LightThemeColors.mdThemeLightBackground,
      onBackground: LightThemeColors.mdThemeLightOnBackground,
      surface: LightThemeColors.mdThemeLightSurface,
      onSurface: LightThemeColors.mdThemeLightOnSurface,
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
     // surfaceTintColor: LightThemeColors.backgroundColorBottomSheet ,
     // indicatorColor: LightThemeColors.secondaryContainerColorS90
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
  //dividerColor: LightThemeColors.outlineVariantColorNV80,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
  //    color: LightThemeColors.outlineColorNV50,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Color(0xFF81737A)),
);
