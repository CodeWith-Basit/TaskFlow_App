import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskflow/Screens/home_screen.dart';
import 'package:taskflow/Screens/task_Screen.dart';
import 'package:taskflow/theme/app_colors.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int initialIndex;
  const BottomNavigationBarWidget({super.key, this.initialIndex = 0});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int activeTab;
  late List<int> tabHistory;

  @override
  void initState() {
    super.initState();
    activeTab = widget.initialIndex;
    tabHistory = [widget.initialIndex];
  }

  void changeTab(int index) {
    setState(() {
      activeTab = index;
      if (tabHistory.isEmpty || tabHistory.last != index) {
        tabHistory.add(index);
      }
    });
  }

  Widget _buildNavItem({
    required int index,
    required FaIconData icon,
    required String label,
  }) {
    final bool isSelected = activeTab == index;
    final Color color = isSelected
        ? AppColors.primary
        : AppColors.textSecondary;

    return Expanded(
      child: InkWell(
        onTap: () => changeTab(index),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 20, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const TaskScreen(),
      const Center(child: Text("Calendar")),
      const Center(child: Text("Profile")),
    ];
    return PopScope(
      canPop: tabHistory.length <= 1,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        setState(() {
          tabHistory.removeLast();
          activeTab = tabHistory.last;
        });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: screens[activeTab],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          elevation: 4,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 10,
          shadowColor: Colors.black.withValues(alpha: 0.15),
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                icon: FontAwesomeIcons.house,
                label: 'Home',
              ),
              _buildNavItem(
                index: 1,
                icon: FontAwesomeIcons.listCheck,
                label: 'Tasks',
              ),
              const SizedBox(width: 56), // Space for the center notched FAB
              _buildNavItem(
                index: 2,
                icon: FontAwesomeIcons.calendar,
                label: 'Calendar',
              ),
              _buildNavItem(
                index: 3,
                icon: FontAwesomeIcons.user,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
