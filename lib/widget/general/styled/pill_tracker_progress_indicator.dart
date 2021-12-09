// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/util/env/flavor_config.dart';
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class PTProgressIndicator extends StatelessWidget {
  final bool dark;

  const PTProgressIndicator.dark() : dark = true;

  const PTProgressIndicator.light() : dark = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        if (FlavorConfig.isInTest()) {
          return Container(
            color: theme.colorsTheme.accent,
            height: 50,
            width: 50,
            child: const Text(
              'CircularProgressIndicator',
              style: TextStyle(fontSize: 8),
            ),
          );
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(dark ? theme.colorsTheme.darkProgressIndicator : theme.colorsTheme.lightProgressIndicator),
        );
      },
    );
  }
}
