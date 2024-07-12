import 'package:scheduled_health/data/db/sembast.dart';

abstract interface class UserRepository {
  Future create({required String username});
}

final class UserRepositoryImpl implements UserRepository {
  final SembastDatabase _db;

  UserRepositoryImpl(this._db);

  @override
  Future create({required String username}) {
    // TODO: implement create
    throw UnimplementedError();
  }
}
