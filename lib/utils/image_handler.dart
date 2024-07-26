enum ImagePathHandler {
  splashScreen(path: 'splashscreen_image'),
  welcomeScreen(path: 'welcome_image');

  final String path;

  const ImagePathHandler({required this.path});

  String get imagePath => 'lib/assets/images/$path.png';
}
