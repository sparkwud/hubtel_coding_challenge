import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_coding_challenge/screens/history_screen.dart';
import 'package:hubtel_coding_challenge/screens/home_screen.dart';
import 'package:hubtel_coding_challenge/screens/scheduled_screen.dart';
import 'package:hubtel_coding_challenge/screens/send_screen.dart';
import 'package:hubtel_coding_challenge/utils/app_drawables.dart';
import 'package:hubtel_coding_challenge/utils/app_palette.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

BottomNavigationBarItem buildSvgNavBarItem({
  required String inactiveIconPath,
  required String activeIconPath,
  required String label,
  bool isHome = false,
}) {
  return BottomNavigationBarItem(
    icon: isHome
        ? IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppPalette.lightTeal,
                  radius: 20,
                  child: SvgPicture.asset(activeIconPath),
                ),
                // const SizedBox(height: 20),
                const VerticalDivider(
                  thickness: 1.2,
                  color: AppPalette.borderGray,
                ),
              ],
            ),
          )
        : SvgPicture.asset(
            inactiveIconPath,
            height: 20,
          ),
    activeIcon: !isHome
        ? SvgPicture.asset(
            activeIconPath,
            height: 20,
            color: Colors.black,
          )
        : null,
    label: label,
  );
}

class _MainContainerState extends State<MainContainer> {
  int _currentPage = 2;

  void onTap(index) {
    setState(() {
      _currentPage = index;
    });
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const SendScreen(),
    const HistoryScreen(),
    const ScheduledScreen(),
  ];
  final List<BottomNavigationBarItem> _navBarItems = [
    buildSvgNavBarItem(
      activeIconPath: AppDrawables.icHome,
      inactiveIconPath: AppDrawables.icHome,
      label: "",
      isHome: true,
    ),
    buildSvgNavBarItem(
      activeIconPath: AppDrawables.icMomo,
      inactiveIconPath: AppDrawables.icMomo,
      label: "Send",
    ),
    // buildSvgNavBarItem(
    //   activeIconPath: AppDrawables.icHistory,
    //   inactiveIconPath: AppDrawables.icHistory,
    //   label: "History",
    // ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: "History",
    ),
    buildSvgNavBarItem(
      activeIconPath: AppDrawables.icSchedule,
      inactiveIconPath: AppDrawables.icSchedule,
      label: "Scheduled",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPage,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppPalette.unselectedColor,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: onTap,
        items: _navBarItems,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Colors.black,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: AppPalette.unselectedColor,
        ),
        selectedFontSize: 13,
        unselectedFontSize: 12,
      ),
    );
  }
}
