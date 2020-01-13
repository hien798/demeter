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
          'Scan Device\'s QR Code',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.layers,
              color: Colors.grey.shade700,
              size: scaleWidth(context, 32),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
