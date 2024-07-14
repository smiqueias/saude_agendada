class User {
  final String name;
  final String createAt;
  final bool shouldShowOnboardingScreen;

  User({
    required this.name,
    required this.createAt,
    this.shouldShowOnboardingScreen = true,
  });
}
