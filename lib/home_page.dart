import 'package:flutter/material.dart';
import 'package:lab_tracker_app/features/data%20management/screens/experiment/experiments_screen.dart';
import 'package:lab_tracker_app/features/data%20management/screens/dashboard_page.dart';
import 'package:lab_tracker_app/features/personalization/screens/settings_page.dart';
import 'package:lab_tracker_app/features/data%20management/screens/task/task_screen.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const DashboardPage(),
    TasksPage(),
    ExperimentsPage(),
    const SettingsPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: List.generate(_pages.length, (index) {
          return Offstage(
            offstage: _selectedIndex != index,
            child: TickerMode(
              enabled: _selectedIndex == index,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: _pages[index],
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
