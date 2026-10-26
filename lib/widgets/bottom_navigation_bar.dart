import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskflow/Screens/home_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const Center(child: Text("Task Category")),
      const Center(child: Text("Calender")),
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
        body: screens[activeTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: activeTab,
          onTap: (index) {
            changeTab(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).cardColor,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          selectedFontSize: 16,
          unselectedItemColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade400
              : AppColors.primaryDark,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.listCheck),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.calendar),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
