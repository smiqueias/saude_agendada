import 'package:scheduled_health/core/app_manager.dart';
import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:scheduled_health/domain/entities/user.dart';
import 'package:scheduled_health/utils/base_view_model.dart';

final class SplashViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  final AppManager _appManager;

  AppManager get manager => _appManager;

  SplashViewModel(this._userRepository, this._appManager);

  Future<User?> getCurrentUser(
    void Function(User? user) onComplete,
  ) async {
    final currentUser = await _userRepository.fetchUserInfo();
    manager.setUser(currentUser);
    onComplete.call(currentUser);
    return currentUser;
  }
}
