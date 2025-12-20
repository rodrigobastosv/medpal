import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';

class MPTheme {
  MPTheme._();

  static ThemeData get lightTheme => theme(lightColorScheme());
  static ThemeData get darkTheme => theme(darkColorScheme());

  static ColorScheme lightColorScheme() => const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1f4e8c),
    surfaceTint: Color(0xFF1f4e8c),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF6f9edc),
    onPrimaryContainer: Color(0xFF002664),
    secondary: Color(0xFF1f8c7b),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFF6fdccb),
    onSecondaryContainer: Color(0xFF006453),
    tertiary: Color(0xFF10B981),
    onTertiary: Color(0xFF000000),
    tertiaryContainer: Color(0xFF60ffd1),
    onTertiaryContainer: Color(0xFF009159),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF93000A),
    surface: Color(0xFFFFFBFE),
    onSurface: Color(0xFF1C1B1F),
    onSurfaceVariant: Color(0xFF49454F),
    outline: Color(0xFF79747E),
    outlineVariant: Color(0xFFCAC4D0),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFF0b3a78),
    primaryFixed: Color(0xFF6f9edc),
    onPrimaryFixed: Color(0xFF001250),
    primaryFixedDim: Color(0xFF5b8ac8),
    onPrimaryFixedVariant: Color(0xFF0b3a78),
    secondaryFixed: Color(0xFF6fdccb),
    onSecondaryFixed: Color(0xFF00503f),
    secondaryFixedDim: Color(0xFF5bc8b7),
    onSecondaryFixedVariant: Color(0xFF0b7867),
    tertiaryFixed: Color(0xFF60ffd1),
    onTertiaryFixed: Color(0xFF007d45),
    tertiaryFixedDim: Color(0xFF4cf5bd),
    onTertiaryFixedVariant: Color(0xFF00a56d),
    surfaceDim: Color(0xFFE6E0E9),
    surfaceBright: Color(0xFFFFFBFE),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF7F2FA),
    surfaceContainer: Color(0xFFF3EDF7),
    surfaceContainerHigh: Color(0xFFECE6F0),
    surfaceContainerHighest: Color(0xFFE6E0E9),
  );

  static ColorScheme darkColorScheme() => const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF0b3a78),
    surfaceTint: Color(0xFF0b3a78),
    onPrimary: Color(0xFF00003c),
    primaryContainer: Color(0xFF001250),
    onPrimaryContainer: Color(0xFF6f9edc),
    secondary: Color(0xFF0b7867),
    onSecondary: Color(0xFF003c2b),
    secondaryContainer: Color(0xFF00503f),
    onSecondaryContainer: Color(0xFF6fdccb),
    tertiary: Color(0xFF00a56d),
    onTertiary: Color(0xFF006931),
    tertiaryContainer: Color(0xFF007d45),
    onTertiaryContainer: Color(0xFF60ffd1),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF10090D),
    onSurface: Color(0xFFE6E0E9),
    onSurfaceVariant: Color(0xFFCAC4D0),
    outline: Color(0xFF938F99),
    outlineVariant: Color(0xFF49454F),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE6E0E9),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF1f4e8c),
    primaryFixed: Color(0xFF6f9edc),
    onPrimaryFixed: Color(0xFF001250),
    primaryFixedDim: Color(0xFF5b8ac8),
    onPrimaryFixedVariant: Color(0xFF0b3a78),
    secondaryFixed: Color(0xFF6fdccb),
    onSecondaryFixed: Color(0xFF00503f),
    secondaryFixedDim: Color(0xFF5bc8b7),
    onSecondaryFixedVariant: Color(0xFF0b7867),
    tertiaryFixed: Color(0xFF60ffd1),
    onTertiaryFixed: Color(0xFF007d45),
    tertiaryFixedDim: Color(0xFF4cf5bd),
    onTertiaryFixedVariant: Color(0xFF00a56d),
    surfaceDim: Color(0xFF10090D),
    surfaceBright: Color(0xFF362F33),
    surfaceContainerLowest: Color(0xff000000),
    surfaceContainerLow: Color(0xFF1D1418),
    surfaceContainer: Color(0xFF211A1E),
    surfaceContainerHigh: Color(0xFF2B2329),
    surfaceContainerHighest: Color(0xFF362F33),
  );

  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: _textTheme,
    appBarTheme: colorScheme.brightness == Brightness.light ? _lightAppBarTheme : _darkAppBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: _textButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    cardTheme: _cardTheme,
    chipTheme: _chipTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
    dividerTheme: _dividerTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    tabBarTheme: _tabBarTheme,
    switchTheme: _switchTheme,
    checkboxTheme: _checkboxTheme,
    radioTheme: _radioTheme,
    sliderTheme: _sliderTheme,
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: MPUiConstants.fontSizeDisplayLarge,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.1228070175438596,
    ),
    displayMedium: TextStyle(
      fontSize: MPUiConstants.fontSizeDisplayMedium,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.1555555555555554,
    ),
    displaySmall: TextStyle(
      fontSize: MPUiConstants.fontSizeDisplaySmall,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.2222222222222223,
    ),
    headlineLarge: TextStyle(fontSize: MPUiConstants.fontSizeHeadlineLarge, fontWeight: FontWeight.w400, letterSpacing: 0, height: 1.25),
    headlineMedium: TextStyle(
      fontSize: MPUiConstants.fontSizeHeadlineMedium,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.2857142857142858,
    ),
    headlineSmall: TextStyle(
      fontSize: MPUiConstants.fontSizeHeadlineSmall,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.3333333333333333,
    ),
    titleLarge: TextStyle(
      fontSize: MPUiConstants.fontSizeTitleLarge,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.2727272727272727,
    ),
    titleMedium: TextStyle(fontSize: MPUiConstants.fontSizeTitleMedium, fontWeight: FontWeight.w500, letterSpacing: 0.15, height: 1.5),
    titleSmall: TextStyle(
      fontSize: MPUiConstants.fontSizeTitleSmall,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.4285714285714286,
    ),
    labelLarge: TextStyle(
      fontSize: MPUiConstants.fontSizeLabelLarge,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.4285714285714286,
    ),
    labelMedium: TextStyle(
      fontSize: MPUiConstants.fontSizeLabelMedium,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.3333333333333333,
    ),
    labelSmall: TextStyle(
      fontSize: MPUiConstants.fontSizeLabelSmall,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.4545454545454546,
    ),
    bodyLarge: TextStyle(fontSize: MPUiConstants.fontSizeBodyLarge, fontWeight: FontWeight.w400, letterSpacing: 0.15, height: 1.5),
    bodyMedium: TextStyle(
      fontSize: MPUiConstants.fontSizeBodyMedium,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.4285714285714286,
    ),
    bodySmall: TextStyle(
      fontSize: MPUiConstants.fontSizeBodySmall,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.3333333333333333,
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: MPUiConstants.elevationLevel2,
      padding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingLG, vertical: MPUiConstants.spacingMD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusMD)),
    ),
  );

  static final TextButtonThemeData _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingLG, vertical: MPUiConstants.spacingMD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusMD)),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingLG, vertical: MPUiConstants.spacingMD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusMD)),
    ),
  );

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingMD, vertical: MPUiConstants.spacingMD),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusMD)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusMD)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusMD)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusMD)),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );

  static const AppBarTheme _lightAppBarTheme = AppBarTheme(
    elevation: MPUiConstants.elevationLevel1,
    centerTitle: false,
    titleSpacing: MPUiConstants.spacingMD,
    scrolledUnderElevation: MPUiConstants.elevationLevel1,
  );

  static const AppBarTheme _darkAppBarTheme = AppBarTheme(
    elevation: MPUiConstants.elevationLevel1,
    centerTitle: false,
    titleSpacing: MPUiConstants.spacingMD,
    scrolledUnderElevation: MPUiConstants.elevationLevel1,
  );

  static final CardThemeData _cardTheme = CardThemeData(
    elevation: MPUiConstants.elevationLevel1,
    margin: const EdgeInsets.all(MPUiConstants.spacingSM),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusLG)),
  );

  static final ChipThemeData _chipTheme = ChipThemeData(
    padding: const EdgeInsets.symmetric(horizontal: MPUiConstants.spacingMD, vertical: MPUiConstants.spacingSM),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusFull)),
  );

  static const ProgressIndicatorThemeData _progressIndicatorTheme = ProgressIndicatorThemeData();

  static const DividerThemeData _dividerTheme = DividerThemeData(thickness: MPUiConstants.borderWidthThin, space: MPUiConstants.spacingMD);

  static const BottomNavigationBarThemeData _bottomNavigationBarTheme = BottomNavigationBarThemeData(type: BottomNavigationBarType.fixed);

  static const TabBarThemeData _tabBarTheme = TabBarThemeData(
    labelPadding: EdgeInsets.symmetric(horizontal: MPUiConstants.spacingMD, vertical: MPUiConstants.spacingSM),
  );

  static final SwitchThemeData _switchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return lightColorScheme().primary;
      }
      return null;
    }),
  );

  static final CheckboxThemeData _checkboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MPUiConstants.radiusXS)),
  );

  static const RadioThemeData _radioTheme = RadioThemeData();

  static const SliderThemeData _sliderTheme = SliderThemeData();
}
