// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_assets.dart';
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/widget/general/svg_icon.dart';
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class PTCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const PTCheckBox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isIOSTheme) {
      return DataProviderWidget(
        childBuilderTheme: (context, theme) => GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            color: Colors.transparent,
            height: ThemeDimens.padding48,
            width: ThemeDimens.padding48,
            child: value
                ? Center(
                    child: SvgIcon(
                      svgAsset: ThemeAssets.doneIcon(context),
                      color: theme.colorsTheme.accent,
                      size: ThemeDimens.padding24,
                    ),
                  )
                : Container(),
          ),
        ),
      );
    }
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Checkbox(
        value: value,
        onChanged: (value) => onChanged(value ?? false),
        activeColor: theme.colorsTheme.accent,
      ),
    );
  }
}
