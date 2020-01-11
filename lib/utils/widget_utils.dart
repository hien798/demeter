import 'package:flutter/material.dart';

scaleWidth(BuildContext context, double width) {
  return width*(MediaQuery.of(context).size.width/375);
}

scaleHeight(BuildContext context, double height) {
  return height*(MediaQuery.of(context).size.height/812);
}

class BottomNaviTabBar extends StatefulWidget {
  final int initialIndex;
  final List<BottomNavigationBarItem> items;
  final Function onTap;

  BottomNaviTabBar(
      {Key key, @required this.items, this.initialIndex = 0, this.onTap})
      : super(key: key);

  @override
  _BottomNaviTabBarState createState() => _BottomNaviTabBarState();
}

class _BottomNaviTabBarState extends State<BottomNaviTabBar> {
  int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.items,
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          _index = index;
        });
        if (widget.onTap != null) {
          widget.onTap(index);
        }
      },
    );
  }
}

class AppbarTitle extends StatefulWidget {
  final TabController controller;
  final List<String> titles;

  AppbarTitle({Key key, @required this.titles, @required this.controller})
      : super(key: key);

  @override
  _AppbarTitleState createState() => _AppbarTitleState();
}

class _AppbarTitleState extends State<AppbarTitle> {
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.controller.index;
    widget.controller.addListener(() {
      if (_currentIndex != widget.controller.index) {
        setState(() {
          _currentIndex = widget.controller.index;
        });
      }
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.titles[_currentIndex],
      style: TextStyle(
        fontSize: scaleWidth(context, 35),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
