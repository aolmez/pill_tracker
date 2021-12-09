// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:pill_tracker/viewmodel/global/global_viewmodel.dart';
import 'package:pill_tracker/widget/debug/selector_item.dart';
import 'package:pill_tracker/widget/provider/data_provider_widget.dart';

class SelectLanguageDialog extends StatelessWidget {
  final VoidCallback goBack;

  const SelectLanguageDialog({
    required this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    final globalViewModel = Provider.of<GlobalViewModel>(context);
    return DataProviderWidget(
      childBuilderLocalization: (context, localization) => AlertDialog(
        title: Text(localization.debugLocaleSelector),
        content: Container(
          height: 150,
          width: MediaQuery.of(context).size.width / 1.2,
          child: ListView(
            shrinkWrap: true,
            children: [
              SelectorItem(
                title: localization.generalLabelSystemDefault,
                selected: globalViewModel.isLanguageSelected(null),
                onClick: () {
                  globalViewModel.onSwitchToSystemLanguage();
                  goBack();
                },
              ),
              SelectorItem(
                title: 'English',
                selected: globalViewModel.isLanguageSelected('en'),
                onClick: () {
                  globalViewModel.onSwitchToEnglish();
                  goBack();
                },
              ),
              SelectorItem(
                title: 'Nederlands',
                selected: globalViewModel.isLanguageSelected('nl'),
                onClick: () {
                  globalViewModel.onSwitchToDutch();
                  goBack();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
