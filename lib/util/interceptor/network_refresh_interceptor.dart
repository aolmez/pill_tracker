// Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:pill_tracker/model/exceptions/un_authorized_error.dart';
import 'package:pill_tracker/repository/refresh/refresh_repository.dart';
import 'package:pill_tracker/repository/secure_storage/auth/auth_storage.dart';
import '../app_constants.dart';

@singleton
class NetworkRefreshInterceptor extends SimpleInterceptor {
  final AuthStorage _authStorage;
  final RefreshRepository _refreshRepo;

  final _excludedPaths = [
    'login',
  ];

  NetworkRefreshInterceptor(
    this._authStorage,
    this._refreshRepo,
  );

  @override
  Future<Object?> onResponse(Response response) {
    _refreshRepo.resetFailure();
    return super.onResponse(response);
  }

  @override
  Future<Object?> onError(DioError error) async {
    final request = error.requestOptions;
    if (_excludedPaths.contains(request.path)) {
      logger.debug('Network refresh interceptor should not intercept');
      return super.onError(error);
    }

    if (error is! UnAuthorizedError) {
      return super.onError(error);
    }

    logger.debug('Refreshing');
    await _refreshRepo.refresh(error);

    final authorizationHeader = '${AppConstants.HEADER_PROTECTED_AUTHENTICATION_PREFIX} ${await _authStorage.getAccessToken()}';
    request.headers[AppConstants.HEADER_AUTHORIZATION] = authorizationHeader;

    return GetIt.instance.get<Dio>().fetch<dynamic>(request);
  }
}
