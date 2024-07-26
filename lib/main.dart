import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:scheduled_health/coordinator/coordinator.dart';
import 'package:scheduled_health/core/di.dart';
import 'package:scheduled_health/data/di.dart';
import 'package:scheduled_health/domain/di.dart';
import 'package:scheduled_health/ui/screens/add_medicine/add_medicine_screen.dart';
import 'package:scheduled_health/ui/screens/home/home_screen.dart';
import 'package:scheduled_health/ui/screens/register/register_screen.dart';
import 'package:scheduled_health/ui/screens/splash/splash_screen.dart';
import 'package:scheduled_health/ui/screens/welcome/welcome_screen.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/ui/theme/color_scheme.dart';
import 'package:scheduled_health/ui/theme/color_scheme_provider.dart';
import 'package:scheduled_health/ui/theme/typography.dart';
import 'package:scheduled_health/utils/constants/constants.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';
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
    return AppThemeProvider(
      appColorScheme: AppColorScheme.light(),
      typography: AppTypography(
        fontFamily: fontFamily,
        lineHeight: AppLineHeight(
          small: 1.2,
          large: 1.4,
        ),
        fontSize: AppFontSize(
          xs_12: 12.0,
          xl_14: 14.0,
          sm_16: 16.0,
          lg_32: 32.0,
          md_24: 24.0,
        ),
        fontWeight: AppFontWeight(
          regular: FontWeight.w400,
          bold: FontWeight.w700,
          semibold: FontWeight.w300,
        ),
      ),
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash.route,
          routes: _setupRoutes(),
          theme: ThemeData(
            fontFamily: fontFamily,
            useMaterial3: false,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: context.colors.white,
                backgroundColor: context.colors.greenSplash,
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacings.xs_16,
                  horizontal: AppSpacings.lg_40 + AppSpacings.lg_40,
                ),
                elevation: 0.0,
                splashFactory: NoSplash.splashFactory,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Map<String, Widget Function(BuildContext)> _setupRoutes() {
    final appRoutes = <String, WidgetBuilder>{
      AppRoutes.welcome.route: (context) => const WelcomeScreen(),
      AppRoutes.splash.route: (context) => SplashScreen(
            onInitApp: _initApp,
          ),
      AppRoutes.home.route: (context) => const HomeScreen(),
      AppRoutes.register.route: (context) => const RegisterScreen(),
      AppRoutes.addMedicine.route: (context) => const AddMedicineScreen(),
    };

    return appRoutes;
  }

  Future<void> _initApp() async {
    await loadDependencies();
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
    await registerCoreLayerDependencies();
    await registerDataLayerDependencies(db: db);
    await registerDomainLayerDependencies();
  }
}

final class ClampingScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}
