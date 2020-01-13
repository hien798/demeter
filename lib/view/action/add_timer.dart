import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

class AddTimer extends StatefulWidget {
  @override
  _AddTimerState createState() => _AddTimerState();
}

class _AddTimerState extends State<AddTimer> {
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
          'Add Timer',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
