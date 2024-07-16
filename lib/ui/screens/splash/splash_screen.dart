import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduled_health/coordinator/coordinator.dart';
import 'package:scheduled_health/core/app_manager.dart';
import 'package:scheduled_health/core/di.dart';
import 'package:scheduled_health/domain/di.dart';
import 'package:scheduled_health/domain/entities/user.dart';
import 'package:scheduled_health/domain/services/user_services.dart';
import 'package:scheduled_health/ui/screens/splash/splash_view_model.dart';
import 'package:scheduled_health/ui/splash_content_widget.dart';

final class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashViewModel _splashViewModel;
  @override
  void initState() {
    super.initState();
    _splashViewModel = SplashViewModel(
      domainLayerGetIt<UserServices>(),
      coreLayerGetIt<AppManager>(),
    );
    _splashViewModel.getCurrentUser(
      (user) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            _handleSplashNavigation(
              context: context,
              user: user,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashContentWidget();
  }

  void _handleSplashNavigation({
    required BuildContext context,
    required User? user,
  }) {
    if (user?.shouldShowOnboardingScreen ?? true) {
      Navigator.pushReplacementNamed(context, AppRoutes.welcome.route);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.main.route);
    }
  }
}
