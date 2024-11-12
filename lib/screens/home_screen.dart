import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtubeclonecording/screens/add_contents_screen.dart';
import 'package:youtubeclonecording/screens/search_screen.dart';
import 'package:youtubeclonecording/screens/sharing_screen.dart';
import 'package:youtubeclonecording/screens/shorts_screen.dart';
import 'package:youtubeclonecording/screens/storage_box_screen.dart';
import 'package:youtubeclonecording/screens/subscribe_screen.dart';

import '../category_list_widget/category_list.dart';
import '../videolist/youtube_video_list.dart';
import '../widgets/myprofile.dart';
import '../widgets/top_button.dart';
import 'alarm_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int _index = 0;

  @override
  void initState(){
    super.initState();

    _tabController = TabController(length: _navItems.length, vsync: this);
    _tabController.addListener(tabListner);
  }

  @override
  void dispose(){
    _tabController.removeListener(tabListner);

    super.dispose();
  }

  void tabListner(){
    setState(() {
      _index = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size(1000, 100),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Image.asset('assets/images/youtubelogo.png'),
                        ),
                        const Flexible(flex: 1, child: SizedBox()),
                        const TopButton(icon: Icons.screen_share, widget: SharingScreen()),
                        const TopButton(icon: CupertinoIcons.alarm, widget: AlarmScreen()),
                        const TopButton(icon: CupertinoIcons.search, widget: SearchScreen()),
                        const Flexible(
                          flex: 1,
                          child: Myprofile(size: 32),
                        ),
                      ],
                    ),
                  ),
                  const Flexible(flex: 1, child: CategoryList()),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
            ),
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              _tabController.animateTo(index);
            },
            currentIndex: _index,
            items: _navItems.map((item) {
                return BottomNavigationBarItem(
                  icon: Icon(item.activeIcon),
                  label: item.label,
                );
            }).toList(),
      ),
    body: TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        YoutubeVideoList(),
        ShortsScreen(),
        AddContentsScreen(),
        SubscribeScreen(),
        StorageBoxScreen(),
      ]
    ),
    ),
    );
  }
}

class NavItem{
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
      label: "shorts"
  ),
  NavItem(
      index: 2,
      activeIcon: CupertinoIcons.plus_circled,
      inactiveIcon: CupertinoIcons.plus_circle_fill,
      label: ""
  ),
  NavItem(
      index: 3,
      activeIcon: Icons.subscriptions,
      inactiveIcon: Icons.subscriptions_outlined,
      label: '구독'
  ),
  NavItem(
      index: 4,
      activeIcon: Icons.video_library,
      inactiveIcon: Icons.video_library_outlined,
      label: '보관함'
  )
];