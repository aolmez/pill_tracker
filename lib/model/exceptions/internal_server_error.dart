// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

// Project imports:
import 'package:pill_tracker/util/locale/localization_keys.dart';

class InternalServerError extends NetworkError {
  static const statusCode = HttpStatus.internalServerError;

  InternalServerError(DioError dioError, {String? statusCode}) : super(dioError, statusCodeValue: statusCode);

  @override
  String getLocalizedKey() => LocalizationKeys.errorInternalServer;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }
}
