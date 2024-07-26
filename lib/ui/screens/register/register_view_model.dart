import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scheduled_health/core/app_manager.dart';
import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:scheduled_health/domain/entities/user.dart';
import 'package:scheduled_health/domain/usecases/validate_username.dart';
import 'package:scheduled_health/ui/app_progress_indicator_barrier.dart';
import 'package:scheduled_health/utils/base_view_model.dart';

import '../../../coordinator/coordinator.dart';

final class RegisterViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  final AppManager _appManager;
  final ValidateUsernameUseCase _validateUsernameUseCase;

  UsernameError _usernameError = UsernameError.none;

  RegisterViewModel({
    required AppManager appManager,
    required UserRepository userRepository,
    required ValidateUsernameUseCase validateUsernameUseCase,
  })  : _userRepository = userRepository,
        _appManager = appManager,
        _validateUsernameUseCase = validateUsernameUseCase;

  UsernameError get usernameError => _usernameError;

  bool get isValidateError => _usernameError != UsernameError.none;

  void validateUsernameField({required TextEditingController username}) {
    _usernameError = _validateUsernameUseCase(username.text);
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
      _appManager.setUser(user);
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          Navigator.pushReplacementNamed(context, AppRoutes.home.route);
        },
      );
    } catch (e, st) {
      if (kDebugMode) {
        print(''
            'Error: $e'
            'Stacktrace: $st'
            '');
      }
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      );
    }
  }

  final snackBar = const SnackBar(
    content: Text('Ocorreu um erro ao tentar salvar, tente novamente'),
  );
}
