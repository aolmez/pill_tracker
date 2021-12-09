// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pill_tracker/app.dart';
import 'package:pill_tracker/di/environments.dart';
import 'package:pill_tracker/di/injectable.dart';
import 'package:pill_tracker/main_common.dart';
import 'package:pill_tracker/util/database/database_inspector.dart';
import 'package:pill_tracker/util/env/flavor_config.dart';
import 'package:pill_tracker/util/niddler/niddler.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initNiddler();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.DEV,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await configureDependencies(Environments.DEV);
    await addDatabaseInspector();

    runApp(MyApp());
  }, enableCrashLogging: false);
}
