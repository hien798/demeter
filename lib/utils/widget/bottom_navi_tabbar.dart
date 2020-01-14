import 'package:flutter/material.dart';

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