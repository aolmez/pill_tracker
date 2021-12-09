// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_data.dart';
import 'package:pill_tracker/util/locale/localization.dart';

class DataProviderWidget extends BaseThemeProviderWidget<PTTheme, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, PTTheme theme)? childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)? childBuilderLocalization,
    Widget Function(BuildContext context, PTTheme theme, Localization localization)? childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
