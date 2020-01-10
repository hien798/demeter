import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  TabController _tabController;
  final tabs = [
    TabData('Home', Icons.home),
    TabData('Store', Icons.local_grocery_store),
    TabData('Notification', Icons.notifications),
    TabData('Account', Icons.person),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: AppbarTitle(
                      controller: _tabController,
                      titles: tabs.map((data) => data.title).toList(),
                    ),
                    centerTitle: false,
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: tabs
                            .map((data) => Center(child: Text(data.title)))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviTabBar(
        items: tabs
            .map((data) => BottomNavigationBarItem(
          icon: Icon(data.iconData),
          title: Text(data.title),
        ))
            .toList(),
        initialIndex: _tabController.index,
        onTap: (index) {
          _tabController.animateTo(index);
        },
      ),
    );
  }
}

class TabData {
  final String title;
  final IconData iconData;

  TabData(this.title, this.iconData);
}
