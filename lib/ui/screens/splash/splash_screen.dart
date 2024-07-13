import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduled_health/coordinator/coordinator.dart';
import 'package:scheduled_health/data/di.dart';
import 'package:scheduled_health/data/repositories/user_repository.dart';
import 'package:scheduled_health/domain/entities/user.dart';
import 'package:scheduled_health/ui/screens/splash/splash_view_model.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

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
      dataLayerGetIt<UserRepository>(),
    );
    _initScreen(
      context: context,
    );
  }

  Future<void> _initScreen({required BuildContext context}) async {
    final currentUser = await dataLayerGetIt<UserRepository>().fetchUserInfo();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _handleSplashNavigation(
          context: context,
          user: currentUser,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: context.colors.greenSplash,
    );
  }

  void _handleSplashNavigation({
    required BuildContext context,
    required User? user,
  }) {
    if (user?.shouldShowOnboardingScreen ?? true) {
      Navigator.pushReplacementNamed(context, AppRoutes.welcome.route);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.home.route);
    }
  }
}
