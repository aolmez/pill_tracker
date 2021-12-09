// Package imports:
import 'package:dio/dio.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/util/locale/localization_keys.dart';

class NoInternetError extends NetworkError {
  NoInternetError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorNoNetwork;

  @override
  String? get getErrorCode => null;
}

class NoNetworkError extends Error {}
