import 'package:scheduled_health/core/app_manager.dart';
import 'package:scheduled_health/domain/entities/user.dart';
import 'package:scheduled_health/domain/services/user_services.dart';
import 'package:scheduled_health/utils/base_view_model.dart';

final class SplashViewModel extends BaseViewModel {
  final UserServices _userServices;
  final AppManager _appManager;

  AppManager get manager => _appManager;

  SplashViewModel(this._userServices, this._appManager);

  Future<User?> getCurrentUser(
    void Function(User? user) onComplete,
  ) async {
    final currentUser = await _userServices.fetchUserInfo();
    manager.setUser(currentUser);
    onComplete.call(currentUser);
    return currentUser;
  }
}
