// Package imports:
import 'package:drift/drift.dart';

part 'pill_tracker_database.g.dart';

@DriftDatabase(tables: [
])
class PTDatabase extends _$PTDatabase {
  PTDatabase(QueryExecutor db) : super(db);

  PTDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  Future<void> deleteAllData() {
    return transaction(() async {
      for (final table in allTables) {
        await delete<Table, dynamic>(table).go();
      }
    });
  }
}
