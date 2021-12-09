// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/styles/theme_durations.dart';
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class TextActionItem extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool enabled;
  final VoidCallback onClick;

  const TextActionItem({
    required this.text,
    required this.enabled,
    required this.onClick,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Center(
        child: TouchFeedBack(
          borderRadius: BorderRadius.circular(ThemeDimens.padding4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ThemeDimens.padding16, vertical: ThemeDimens.padding8),
            child: AnimatedDefaultTextStyle(
              style: style ?? theme.lightTextTheme.labelButtonSmall,
              child: Text(text),
              duration: ThemeDurations.shortAnimationDuration(),
            ),
          ),
          onClick: enabled ? onClick : null,
        ),
      ),
    );
  }
}
