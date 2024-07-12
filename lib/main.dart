import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:scheduled_health/coordinator/coordinator.dart';
import 'package:scheduled_health/data/di.dart';
import 'package:scheduled_health/ui/screens/welcome/welcome_screen.dart';
import 'package:scheduled_health/ui/theme/color_scheme.dart';
import 'package:scheduled_health/ui/theme/color_scheme_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

void main() {
  runApp(const MainApp());
}

const String _dbName = 'scheduled_health_db';
const _schemaVersion = 1;

final class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppColorSchemeProvider(
      appColorScheme: AppColorScheme.light(),
      builder: (context) {
        return MaterialApp(
          initialRoute: WelcomeScreen.routeName,
          routes: appRoutes,
        );
      },
    );
  }

  Future<Database> openDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);

    final dbPath = path.join(directory.path, _dbName);

    return databaseFactoryIo.openDatabase(
      dbPath,
      version: _schemaVersion,
    );
  }

  Future<void> loadDependencies() async {
    final db = await openDatabase();

    await registerDataLayerDependencies(db: db);
  }
}
