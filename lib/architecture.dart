// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_data.dart';
import 'package:pill_tracker/util/locale/localization.dart';

L _getLocale<L>(BuildContext context) => Localization.of(context) as L;

T _getTheme<T>(BuildContext context) => PTTheme.of(context) as T;

Future<void> initArchitecture() async {
  await OsInfo.init();
  localizationLookup = _getLocale;
  themeLookup = _getTheme;
}
