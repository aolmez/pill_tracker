// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:drift_inspector/drift_inspector.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:pill_tracker/database/pill_tracker_database.dart';

Future<void> addDatabaseInspector() async {
  if (!kDebugMode) return;

  final database = GetIt.I<PTDatabase>();

  final driftInspectorBuilder = DriftInspectorBuilder()
    ..bundleId = 'com.icapps.pill_tracker'
    ..icon = 'flutter'
    ..addDatabase('pill_tracker', database);

  final inspector = driftInspectorBuilder.build();

  await inspector.start();

  // ignore: avoid_print
  print('Started drift inspector');
}
