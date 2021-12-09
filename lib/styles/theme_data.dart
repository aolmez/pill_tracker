// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_colors.dart';
import 'package:pill_tracker/styles/theme_fonts.dart';

class PTThemeData {
  PTThemeData._();

  static final _darkThemeData = ThemeData(
    fontFamily: ThemeFonts.OpenSans,
    primaryColor: ThemeColors.primary,
    colorScheme: const ColorScheme(
      primary: ThemeColors.primary,
      primaryVariant: ThemeColors.primaryDark,
      onPrimary: ThemeColors.white,
      secondary: ThemeColors.accent,
      secondaryVariant: ThemeColors.accent,
      onSecondary: ThemeColors.white,
      surface: ThemeColors.backgroundGrey,
      onBackground: ThemeColors.primary,
      onSurface: ThemeColors.primary,
      background: ThemeColors.backgroundGrey,
      onError: ThemeColors.primaryDark,
      brightness: Brightness.light,
      error: ThemeColors.error,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeColors.accent,
      selectionHandleColor: ThemeColors.accent,
      selectionColor: ThemeColors.accent.withOpacity(0.4),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: isInTest ? const FadeUpwardsPageTransitionsBuilder() : BaseThemeData.getCorrectPageTransitionBuilder(OsInfo.instance),
      },
    ),
  );

  static final _lightThemeData = _darkThemeData.copyWith();

  static ThemeData darkTheme(TargetPlatform? targetPlatform) {
    return _darkThemeData.copyWith(platform: targetPlatform);
  }

  static ThemeData lightTheme(TargetPlatform? targetPlatform) {
    return _lightThemeData.copyWith(platform: targetPlatform);
  }
}

class PTTextTheme {
  final TextStyle titleHuge;
  final TextStyle titleBig;
  final TextStyle titleNormal;
  final TextStyle titleSmall;

  final TextStyle titleListItem;

  final TextStyle labelButtonBig;
  final TextStyle labelButtonSmall;

  final TextStyle bodyNormal;
  final TextStyle bodySmall;
  final TextStyle bodyUltraSmall;
  final TextStyle infoBodySubHeader;
  final TextStyle bodyBig;

  const PTTextTheme({
    required this.titleHuge,
    required this.titleBig,
    required this.titleNormal,
    required this.titleSmall,
    required this.titleListItem,
    required this.labelButtonBig,
    required this.labelButtonSmall,
    required this.bodyNormal,
    required this.bodySmall,
    required this.bodyUltraSmall,
    required this.infoBodySubHeader,
    required this.bodyBig,
  });
}

class PTTextThemeExceptions {
  const PTTextThemeExceptions();
}

class PTColorsTheme {
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color backgroundDark;
  final Color inputFieldFill;
  final Color disabled;
  final Color lightIcon;
  final Color darkIcon;
  final Color lightProgressIndicator;
  final Color darkProgressIndicator;

  const PTColorsTheme({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.backgroundDark,
    required this.inputFieldFill,
    required this.disabled,
    required this.lightIcon,
    required this.darkIcon,
    required this.lightProgressIndicator,
    required this.darkProgressIndicator,
  });
}

class PTTheme {
  final PTTextTheme darkTextTheme;
  final PTTextTheme lightTextTheme;
  final PTTextTheme accentTextTheme;
  final PTTextThemeExceptions exceptionsTextTheme;
  final PTColorsTheme colorsTheme;

  static const _instanceDark = PTTheme._(
    darkTextTheme: PTTextTheme(
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans),
      infoBodySubHeader: TextStyle(fontSize: 14, color: ThemeColors.black, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.w600),
    ),
    lightTextTheme: PTTextTheme(
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      infoBodySubHeader: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.w600),
    ),
    accentTextTheme: PTTextTheme(
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      infoBodySubHeader: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.w600),
    ),
    exceptionsTextTheme: PTTextThemeExceptions(),
    colorsTheme: PTColorsTheme(
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      secondary: ThemeColors.white,
      background: ThemeColors.white,
      backgroundDark: ThemeColors.primary,
      inputFieldFill: ThemeColors.white,
      disabled: ThemeColors.disabledGrey,
      lightIcon: ThemeColors.white,
      darkIcon: ThemeColors.black,
      darkProgressIndicator: ThemeColors.primary,
      lightProgressIndicator: ThemeColors.white,
    ),
  );

  const PTTheme._({
    required this.darkTextTheme,
    required this.lightTextTheme,
    required this.accentTextTheme,
    required this.exceptionsTextTheme,
    required this.colorsTheme,
  });

  static PTTheme of(BuildContext context) => _instanceDark;
}
