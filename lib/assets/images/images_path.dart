enum ImagePaths {
  splashScreen,
  welcomeScreen,
}

extension AssetPathsExtension on ImagePaths {
  String get path {
    switch (this) {
      case ImagePaths.splashScreen:
        return 'lib/assets/images/splashscreen_image.png';
      case ImagePaths.welcomeScreen:
        return 'lib/assets/images/welcome_image.png';
    }
  }
}
