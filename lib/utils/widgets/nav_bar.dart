import 'package:flutter/material.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import '../constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const _IconWithPadding(icon: Icons.dashboard_outlined),
          activeIcon: const _FocusedIcon(icon: Icons.dashboard),
          label: S.of(context).navbar_dash,
        ),
        BottomNavigationBarItem(
          icon: const _IconWithPadding(icon: Icons.task_outlined),
          activeIcon: const _FocusedIcon(icon: Icons.task),
          label: S.of(context).navbar_tasks,
        ),
        BottomNavigationBarItem(
          icon: const _IconWithPadding(icon: Icons.science_outlined),
          activeIcon: const _FocusedIcon(icon: Icons.science),
          label: S.of(context).navbar_exp,
        ),
        BottomNavigationBarItem(
          icon: const _IconWithPadding(icon: Icons.settings_outlined),
          activeIcon: const _FocusedIcon(icon: Icons.settings),
          label: S.of(context).navbar_set,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: onTap,
      iconSize: 30,
      selectedFontSize: 16,
      unselectedFontSize: 14,
    );
  }
}

class _IconWithPadding extends StatelessWidget {
  final IconData icon;

  const _IconWithPadding({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Icon(icon, size: 30),
    );
  }
}

class _FocusedIcon extends StatelessWidget {
  final IconData icon;

  const _FocusedIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
