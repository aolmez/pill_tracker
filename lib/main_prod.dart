// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/app.dart';
import 'package:pill_tracker/architecture.dart';
import 'package:pill_tracker/di/environments.dart';
import 'package:pill_tracker/di/injectable.dart';
import 'package:pill_tracker/main_common.dart';
import 'package:pill_tracker/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initArchitecture();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.PROD,
      name: 'PROD',
      color: Colors.transparent,
      values: values,
    );
    await configureDependencies(Environments.PROD);
    runApp(MyApp());
  }, enableCrashLogging: true);
}
