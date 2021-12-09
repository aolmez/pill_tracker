// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/widget/general/svg_icon.dart';
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class ActionItem extends StatelessWidget {
  final String svgAsset;
  final VoidCallback? onClick;
  final Color? color;

  const ActionItem({
    required this.svgAsset,
    required this.onClick,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        height: ThemeDimens.padding56,
        width: ThemeDimens.padding56,
        child: Center(
          child: Container(
            height: ThemeDimens.padding48,
            width: ThemeDimens.padding48,
            child: TouchFeedBack(
              borderRadius: BorderRadius.circular(ThemeDimens.padding48),
              child: Center(
                child: SvgIcon(
                  svgAsset: svgAsset,
                  size: ThemeDimens.padding24,
                  color: color ?? theme.colorsTheme.lightIcon,
                ),
              ),
              onClick: onClick,
            ),
          ),
        ),
      ),
    );
  }
}
