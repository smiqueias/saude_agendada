import 'package:scheduled_health/data/db/sembast.dart';
import 'package:scheduled_health/data/serializers/user_serializer.dart';
import 'package:scheduled_health/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<void> create({required User user});
  Future<User?> fetchUserInfo();
}

final class UserRepositoryImpl implements UserRepository {
  final SembastDatabase _db;

  final _userStore = 'user_store';
  final _userRecord = 'user_record';

  UserRepositoryImpl(this._db);

  @override
  Future<void> create({required User user}) async {
    try {
      await _db.put(
        id: _userRecord,
        object: UserSerializer.shared.to(user),
        store: _userStore,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> fetchUserInfo() async {
    try {
      final user = await _db.get(
        id: _userRecord,
        store: _userStore,
      );
      return user != null ? UserSerializer.shared.from(user) : null;
    } catch (e) {
      rethrow;
    }
  }
}
