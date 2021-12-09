// Package imports:
import 'package:dio/dio.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:pill_tracker/repository/secure_storage/auth/auth_storage.dart';
import 'package:pill_tracker/util/app_constants.dart';

@singleton
class NetworkAuthInterceptor extends SimpleInterceptor {
  final AuthStorage _storage;
  final _excludedPaths = [
    'login',
  ];

  NetworkAuthInterceptor(this._storage);

  @override
  Future<Object?> onRequest(RequestOptions options) async {
    if (_excludedPaths.contains(options.path)) {
      return super.onRequest(options);
    }
    final authorizationHeader = '${AppConstants.HEADER_PROTECTED_AUTHENTICATION_PREFIX} ${await _storage.getAccessToken()}';
    options.headers[AppConstants.HEADER_AUTHORIZATION] = authorizationHeader;
    return options;
  }
}
