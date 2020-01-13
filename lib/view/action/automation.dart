import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

class Automation extends StatefulWidget {
  @override
  _AutomationState createState() => _AutomationState();
}

class _AutomationState extends State<Automation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeeeeee),
        title: Text(
          'Automation',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
