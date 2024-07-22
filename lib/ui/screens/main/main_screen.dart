import 'package:flutter/material.dart';
import 'package:scheduled_health/ui/screens/add_medicine/add_medicine_screen.dart';
import 'package:scheduled_health/ui/screens/home/home_screen.dart';
import 'package:scheduled_health/ui/widgets/app_bottom_nav_bar.dart';

enum MainScreen {
  myMedicines(label: 'Meus medicamentos'),
  newMedicine(label: 'Novo medicamento');

  final String label;

  const MainScreen({required this.label});
}

final class MainScreenSwitcher extends StatefulWidget {
  const MainScreenSwitcher({super.key});

  @override
  State<MainScreenSwitcher> createState() => _MainScreenSwitcherState();
}

class _MainScreenSwitcherState extends State<MainScreenSwitcher> {
  late MainScreen _currentScreen;

  void _setScreen(MainScreen screen) {
    setState(() => _currentScreen = screen);
  }

  @override
  void initState() {
    super.initState();
    _currentScreen = MainScreen.myMedicines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentScreen.index,
              children: [
                const HomeScreen(),
                AddMedicineScreen(),
              ],
            ),
          ),
          AppBottomNavBar(
            currentIndex: _currentScreen.index,
            onTap: (int index) {
              final screen = MainScreen.values[index];
              _setScreen(screen);
            },
            navItems: [
              AppBottomNavBarItem(
                label: MainScreen.myMedicines.label,
                icon: Icons.list,
              ),
              AppBottomNavBarItem(
                label: MainScreen.newMedicine.label,
                icon: Icons.add_circle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
