// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class PTInputField extends StatelessWidget {
  final String hint;
  final bool enabled;
  final ValueChanged<String> onChanged;

  const PTInputField({
    required this.hint,
    required this.onChanged,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TextField(
        enabled: enabled,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          fillColor: theme.colorsTheme.inputFieldFill,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
