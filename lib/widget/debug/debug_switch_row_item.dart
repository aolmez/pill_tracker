// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/widget/general/styled/pill_tracker_switch.dart';

class DebugRowSwitchItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const DebugRowSwitchItem({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TouchFeedBack(
      onClick: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.all(ThemeDimens.padding16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.headline6,
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: textTheme.subtitle2,
                    ),
                ],
              ),
            ),
            PTSwitch(
              value: value,
              onChanged: onChanged,
            )
          ],
        ),
      ),
    );
  }
}
