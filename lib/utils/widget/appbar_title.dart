import 'package:flutter/material.dart';
import 'package:demeter/utils/widget_utils.dart';

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
        color: Colors.white,
        fontSize: scaleWidth(context, 35),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
