// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:pill_tracker/navigator/mixin/back_navigator.dart';
import 'package:pill_tracker/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:pill_tracker/viewmodel/global/global_viewmodel.dart';
import 'package:pill_tracker/widget/debug/selector_item.dart';
import 'package:pill_tracker/widget/general/styled/pill_tracker_back_button.dart';
import 'package:pill_tracker/widget/provider/provider_widget.dart';

class DebugPlatformSelectorScreen extends StatefulWidget {
  static const String routeName = 'debug_platform_selector';

  const DebugPlatformSelectorScreen({
    Key? key,
  }) : super(key: key);

  @override
  DebugPlatformSelectorScreenState createState() => DebugPlatformSelectorScreenState();
}

@visibleForTesting
class DebugPlatformSelectorScreenState extends State<DebugPlatformSelectorScreen> with BackNavigatorMixin implements DebugPlatformSelectorNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugPlatformSelectorViewModel>(
      childBuilderWithViewModel: (context, value, _, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: PTBackButton.light(onClick: value.onBackClicked),
          title: const Text('Select a platform'),
        ),
        body: Consumer<GlobalViewModel>(
          builder: (context, viewModel, child) => ListView(
            children: [
              SelectorItem(
                title: localization.generalLabelSystemDefault,
                onClick: viewModel.setSelectedPlatformToDefault,
                selected: viewModel.targetPlatform == null,
              ),
              SelectorItem(
                title: localization.generalLabelAndroid,
                onClick: viewModel.setSelectedPlatformToAndroid,
                selected: viewModel.targetPlatform == TargetPlatform.android,
              ),
              SelectorItem(
                title: localization.generalLabelIos,
                onClick: viewModel.setSelectedPlatformToIOS,
                selected: viewModel.targetPlatform == TargetPlatform.iOS,
              ),
            ],
          ),
        ),
      ),
      create: () => GetIt.I()..init(this),
    );
  }
}
