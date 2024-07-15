import 'package:flutter/material.dart';
import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:scheduled_health/domain/entities/user.dart';
import 'package:scheduled_health/domain/validators/register_user_validators.dart';
import 'package:scheduled_health/ui/app_progress_indicator_barrier.dart';
import 'package:scheduled_health/utils/base_view_model.dart';

final class RegisterViewModel extends BaseViewModel {
  final UserRepository _userRepository;

  String _errorMessage = "";

  RegisterViewModel({required UserRepository userRepository})
      : _userRepository = userRepository;

  String get errorMessage => _errorMessage;
  bool get isValidateError => errorMessage.isNotEmpty;

  void validateUsernameField({required TextEditingController username}) {
    _errorMessage = usernameValidator(username.text);
    notify();
  }

  Future<void> registerUser({
    required String username,
    required BuildContext context,
  }) async {
    try {
      final User user = User(
        name: username,
        createAt: DateTime.now().toString(),
        shouldShowOnboardingScreen: false,
      );
      final doRequest = _userRepository.create(user: user);
      await showAppProgressIndicatorBarrier(
        context: context,
        future: doRequest,
      );
    } catch (e, st) {
      print(''
          'Error: $e'
          'Stacktrace: $st'
          '');
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      );
    }
  }

  final snackBar = const SnackBar(
    content: const Text('Ocorreu um error'),
  );
}
