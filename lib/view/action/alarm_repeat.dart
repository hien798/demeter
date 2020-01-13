import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

class AlarmRepeat extends StatefulWidget {
  @override
  _AlarmRepeatState createState() => _AlarmRepeatState();
}

class _AlarmRepeatState extends State<AlarmRepeat> {
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
          'Repeat',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
