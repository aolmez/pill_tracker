// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:pill_tracker/navigator/mixin/back_navigator.dart';
import 'package:pill_tracker/styles/theme_dimens.dart';
import 'package:pill_tracker/viewmodel/license/license_viewmodel.dart';
import 'package:pill_tracker/widget/general/styled/pill_tracker_back_button.dart';
import 'package:pill_tracker/widget/provider/provider_widget.dart';

class LicenseScreen extends StatefulWidget {
  static const String routeName = 'license';

  const LicenseScreen({
    Key? key,
  }) : super(key: key);

  @override
  LicenseScreenState createState() => LicenseScreenState();
}

@visibleForTesting
class LicenseScreenState extends State<LicenseScreen> with BackNavigatorMixin implements LicenseNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LicenseViewModel>(
      consumerWithThemeAndLocalization: (context, viewModel, child, _, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: PTBackButton.light(onClick: viewModel.onBackClicked),
          title: Text(localization.debugLicensesTitle),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          itemCount: viewModel.licenses.length,
          itemBuilder: (context, index) {
            final item = viewModel.licenses[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Container(height: ThemeDimens.padding8),
                    Text(
                      item.license,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      create: () => GetIt.I()..init(this),
    );
  }
}
