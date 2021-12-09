// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/widget/general/styled/pill_tracker_checkbox.dart';

class TodoRowItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const TodoRowItem({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeDimens.padding16,
          vertical: ThemeDimens.padding8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            PTCheckBox(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
