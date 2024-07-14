import 'package:get_it/get_it.dart';
import 'package:scheduled_health/core/app_manager.dart';

final getIt = GetIt.asNewInstance();

GetIt get coreLayerGetIt => getIt;

Future<void> registerCoreLayerDependencies() async {
  await getIt.reset();

  getIt.registerSingleton<AppManager>(
    AppManagerImpl(),
  );
}
