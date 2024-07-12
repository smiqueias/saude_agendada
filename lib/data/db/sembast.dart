import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:scheduled_health/data/db/data_base.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

const String _dbName = 'scheduled_health_db';
const _schemaVersion = 1;

abstract interface class SembastDatabaseHandler {
  Future<void> put({
    required String id,
    required Map<String, dynamic> object,
    required String store,
    bool shouldMerge = true,
  });

  Future<Map<String, dynamic>?> get({
    required String id,
    required String store,
  });

  Future<List<Map<String, dynamic>>> getAll({
    required String store,
    Finder? finder,
  });

  Future<void> remove({
    required String id,
    required String store,
  });

  Future<void> removeAll({
    required List<String> ids,
    required String store,
  });
}

final class SembastDatabaseInit implements AppDataBase {
  @override
  Future<Database> openDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);

    final dbPath = path.join(directory.path, _dbName);

    return databaseFactoryIo.openDatabase(
      dbPath,
      version: _schemaVersion,
    );
  }
}

final class SembastDatabase implements SembastDatabaseHandler {
  final Database db;

  SembastDatabase({required this.db});

  @override
  Future<void> put({
    required String id,
    required Map<String, dynamic> object,
    required String store,
    bool shouldMerge = true,
  }) async {}

  @override
  Future<Map<String, dynamic>?> get({
    required String id,
    required String store,
  }) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({
    required String store,
    Finder? finder,
  }) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<void> remove({
    required String id,
    required String store,
  }) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> removeAll({
    required List<String> ids,
    required String store,
  }) {
    // TODO: implement removeAll
    throw UnimplementedError();
  }
}
