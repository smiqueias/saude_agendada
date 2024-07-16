import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:scheduled_health/data/serializers/user_serializer.dart';
import 'package:scheduled_health/domain/entities/user.dart';

abstract interface class UserServices {
  Future<bool> create({required User user});
  Future<User?> fetchUserInfo();
}

final class UserServicesImpl implements UserServices {
  final UserRepository _userRepository;

  UserServicesImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<bool> create({required User user}) async {
    try {
      bool isCreateUserSuccessfully = false;
      await _userRepository.create(user: user);
      isCreateUserSuccessfully = true;
      return isCreateUserSuccessfully;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> fetchUserInfo() async {
    try {
      final user = await _userRepository.fetchUserInfo();
      return user != null ? UserSerializer.shared.from(user) : null;
    } catch (e) {
      rethrow;
    }
  }
}
