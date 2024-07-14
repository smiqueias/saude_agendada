import 'package:scheduled_health/domain/entities/user.dart';

abstract interface class AppManager {
  void setUser(User? currentUser);
  User? get currentUser;
}

final class AppManagerImpl implements AppManager {
  User? _user;

  @override
  void setUser(User? currentUser) {
    _user = currentUser;
  }

  @override
  User? get currentUser => _user;
}
