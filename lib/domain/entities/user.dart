class User {
  final String name;
  final DateTime? createAt;
  final bool shouldShowOnboardingScreen;

  User({
    required this.name,
    this.shouldShowOnboardingScreen = true,
    this.createAt,
  });
}
