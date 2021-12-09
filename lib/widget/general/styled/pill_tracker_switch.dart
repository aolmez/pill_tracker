// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class PTSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const PTSwitch({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: theme.colorsTheme.accent,
      ),
    );
  }
}
