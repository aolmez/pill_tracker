// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class DebugRowTitle extends StatelessWidget {
  final String title;

  const DebugRowTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeDimens.padding16,
          vertical: ThemeDimens.padding8,
        ),
        color: theme.colorsTheme.disabled,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
