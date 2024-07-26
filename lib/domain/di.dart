import 'package:get_it/get_it.dart';
import 'package:scheduled_health/data/di.dart';
import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:scheduled_health/domain/services/user_services.dart';
import 'package:scheduled_health/domain/usecases/validate_username.dart';

final getIt = GetIt.asNewInstance();

GetIt get domainLayerGetIt => getIt;

Future<void> registerDomainLayerDependencies() async {
  await getIt.reset();

  getIt.registerSingleton<UserServices>(
    UserServicesImpl(
      userRepository: dataLayerGetIt<UserRepository>(),
    ),
  );

  getIt.registerSingleton<ValidateUsernameUseCase>(
    ValidateUsernameUseCase(),
  );
}
