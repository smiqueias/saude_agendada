import 'package:scheduled_health/data/serializers/serializer.dart';
import 'package:scheduled_health/domain/entities/user.dart';

sealed class UserKeys {
  static const username = 'username';
  static const createAt = 'createAt';
  static const shouldShowOnboardingScreen = 'shouldShowOnboardingScreen';
}

final class UserSerializer implements Serializer<User, Map<String, dynamic>> {
  UserSerializer._();

  static final UserSerializer _instance = UserSerializer._();
  static UserSerializer get shared => _instance;

  @override
  User from(Map<String, dynamic> json) {
    final name = json[UserKeys.username] as String?;
    final createAt = DateTime.tryParse(json[UserKeys.createAt]);
    final shouldShowOnboardingScreen =
        json[UserKeys.shouldShowOnboardingScreen] as bool?;

    return User(
      name: name ?? '-',
      createAt: createAt,
      shouldShowOnboardingScreen: shouldShowOnboardingScreen ?? true,
    );
  }

  @override
  Map<String, dynamic> to(User object) => <String, dynamic>{
        UserKeys.username: object.name,
        UserKeys.createAt: object.createAt,
      };
}
