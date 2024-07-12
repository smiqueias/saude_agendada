import 'package:get_it/get_it.dart';
import 'package:scheduled_health/data/db/sembast.dart';
import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:sembast/sembast.dart';

final getIt = GetIt.asNewInstance();

GetIt get dataLayerGetIt => getIt;

Future<void> registerDataLayerDependencies({
  required Database db,
}) async {
  await getIt.reset();

  getIt.registerSingleton<SembastDatabase>(
    SembastDatabase(
      db: db,
    ),
  );

  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      getIt<SembastDatabase>(),
    ),
  );
}
