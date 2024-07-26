enum AppRoutes {
  welcome(route: '/welcome'),
  splash(route: '/splash'),
  home(route: '/home'),
  register(route: '/register'),
  addMedicine(route: '/add-medicine');

  final String route;

  const AppRoutes({required this.route});
}
