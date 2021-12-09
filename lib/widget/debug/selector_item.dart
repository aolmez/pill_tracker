// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_assets.dart';
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/widget/general/svg_icon.dart';
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class SelectorItem extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final bool selected;

  const SelectorItem({
    required this.onClick,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TouchFeedBack(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          child: Row(
            children: [
              Expanded(
                child: Text(title),
              ),
              Opacity(
                opacity: selected ? 1 : 0,
                child: SvgIcon(
                  svgAsset: ThemeAssets.doneIcon(context),
                  color: theme.colorsTheme.accent,
                ),
              ),
            ],
          ),
        ),
        onClick: onClick,
      ),
    );
  }
}
