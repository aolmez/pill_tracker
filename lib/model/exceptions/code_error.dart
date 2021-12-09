// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/util/env/flavor_config.dart';
import 'package:pill_tracker/util/locale/localization_keys.dart';

class CodeError with LocalizedError {
  @override
  String getLocalizedKey() {
    if (FlavorConfig.isDev()) {
      return LocalizationKeys.errorDuringDev;
    }
    return LocalizationKeys.errorGeneral;
  }
}
