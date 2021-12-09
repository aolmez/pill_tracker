// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:pill_tracker/navigator/mixin/back_navigator.dart';
import 'package:pill_tracker/util/license.dart';

@injectable
class LicenseViewModel with ChangeNotifierEx {
  late LicenseNavigator _navigator;

  List<License> get licenses => LicenseUtil.getLicenses();

  Future<void> init(LicenseNavigator navigator) async {
    _navigator = navigator;
  }

  void onBackClicked() => _navigator.goBack<void>();
}

abstract class LicenseNavigator with BackNavigator {}
