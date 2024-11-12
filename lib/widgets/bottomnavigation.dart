import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final TabController tabController;
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    Key? key,
    required this.tabController,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 28,
      selectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 10,
      ),
      type: BottomNavigationBarType.fixed,
      onTap: widget.onTap,
      currentIndex: widget.currentIndex,
      items: _navItems.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item.activeIcon,),
          label: item.label,
        );
      }).toList(),
    );
  }
}
class NavItem {
  final int index;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String label;

  const NavItem({
    required this.index,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
  });
}
const _navItems = [
  NavItem(
    index: 0,
    activeIcon: Icons.home,
    inactiveIcon: Icons.home_outlined,
    label: '홈',
  ),
  NavItem(
    index: 1,
    activeIcon: Icons.bolt,
    inactiveIcon: Icons.bolt_outlined,
    label: "shorts",
  ),
  NavItem(
    index: 2,
    activeIcon: CupertinoIcons.plus_circled,
    inactiveIcon: CupertinoIcons.plus_circle_fill,
    label: "",
  ),
  NavItem(
    index: 3,
    activeIcon: Icons.subscriptions,
    inactiveIcon: Icons.subscriptions_outlined,
    label: '구독',
  ),
  NavItem(
    index: 4,
    activeIcon: Icons.video_library,
    inactiveIcon: Icons.video_library_outlined,
    label: '보관함',
  ),
];