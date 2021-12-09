// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/app.dart';
import 'package:pill_tracker/di/environments.dart';
import 'package:pill_tracker/di/injectable.dart';
import 'package:pill_tracker/main_common.dart';
import 'package:pill_tracker/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.DUMMY,
      name: 'DUMMY',
      color: Colors.purple,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main_dummy.dart');
    await configureDependencies(Environments.DUMMY);
    runApp(MyApp());
  }, enableCrashLogging: true);
}
