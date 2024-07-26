import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';
import 'package:scheduled_health/utils/image_handler.dart';

final class SplashContentWidget extends StatelessWidget {
  const SplashContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: context.colors.greenSplash,
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double screenHeight = constraints.maxHeight;
                return Image.asset(
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.5,
                  ImagePathHandler.splashScreen.imagePath,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
