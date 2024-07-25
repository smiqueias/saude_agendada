import 'package:flutter/material.dart';
import 'package:scheduled_health/assets/images/images_path.dart';

final class SplashContentWidget extends StatelessWidget {
  const SplashContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: const Color(0xFF000000),
      //0xFF2DA35D
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;
            return Image.asset(
              height: screenHeight * 0.5,
              width: screenWidth * 0.5,
              ImagePaths.splashScreen.path,
            );
          },
        ),
      ),
    );
  }
}
