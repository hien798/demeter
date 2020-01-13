import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

import '../../utils/widget_utils.dart';

class Pump extends StatefulWidget {
  @override
  _PumpState createState() => _PumpState();
}

class _PumpState extends State<Pump> {
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
          'Pump',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey.shade700,
              size: scaleWidth(context, 32),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: scaleWidth(context, 106)),
          Container(
            margin: EdgeInsets.all(24),
            width: scaleWidth(context, 248),
            height: scaleWidth(context, 248),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pump.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(scaleWidth(context, 30))),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: _buildPumpDevice('History', Icons.history)),
                Expanded(child: _buildPumpDevice('Timer', Icons.timer)),
                Expanded(child: _buildPumpDevice('Alarm', Icons.alarm)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPumpDevice(String name, IconData icon) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: size.width / 3,
            height: size.width / 3,
            padding: EdgeInsets.all(scaleWidth(context, 24)),
            child: OutlineButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              borderSide: BorderSide(color: Colors.grey),
              shape: CircleBorder(),
              child: Container(
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: scaleWidth(context, 50),
                  )),
            ),
          ),
          Container(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: scaleWidth(context, 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
