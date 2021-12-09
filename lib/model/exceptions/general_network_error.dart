// Package imports:
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/util/locale/localization_keys.dart';

class GeneralError with LocalizedError {
  GeneralError() : super();

  @override
  String getLocalizedKey() => LocalizationKeys.errorGeneral;
}
