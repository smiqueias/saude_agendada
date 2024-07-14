import 'package:flutter/material.dart';

final class SplashContentWidget extends StatelessWidget {
  const SplashContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: const Color(0xFF2DA35D),
    );
  }
}
