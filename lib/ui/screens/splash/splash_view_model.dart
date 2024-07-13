import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:scheduled_health/domain/entities/user.dart';
import 'package:scheduled_health/utils/base_view_model.dart';

final class SplashViewModel extends BaseViewModel {
  final UserRepository _userRepository;

  SplashViewModel(this._userRepository);

  Future<User?> getCurrentUser() async {
    final currentUser = await _userRepository.fetchUserInfo();

    return currentUser;
  }
}
