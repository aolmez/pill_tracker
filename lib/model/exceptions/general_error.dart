// Package imports:
import 'package:dio/dio.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/util/locale/localization_keys.dart';

class GeneralNetworkError extends NetworkError {
  GeneralNetworkError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorGeneral;

  @override
  String? get getErrorCode => null;
}
