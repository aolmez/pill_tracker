// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_assets.dart';
import 'package:pill_tracker/util/keys.dart';
import 'package:pill_tracker/widget/general/action/action_item.dart';
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class PTBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;

  const PTBackButton.light({
    required this.onClick,
    this.fullScreen = false,
  }) : isLight = true;

  const PTBackButton.dark({
    required this.onClick,
    this.fullScreen = false,
  }) : isLight = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => ActionItem(
        key: Keys.backButton,
        svgAsset: getCorrectIcon(context),
        color: isLight ? theme.colorsTheme.lightIcon : theme.colorsTheme.darkIcon,
        onClick: onClick,
      ),
    );
  }

  String getCorrectIcon(BuildContext context) {
    if (fullScreen) {
      return ThemeAssets.closeIcon(context);
    }
    return ThemeAssets.backIcon(context);
  }
}
