import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

class RegisterDevice extends StatefulWidget {
  @override
  _RegisterDeviceState createState() => _RegisterDeviceState();
}

class _RegisterDeviceState extends State<RegisterDevice> {
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
          'Register Device',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
