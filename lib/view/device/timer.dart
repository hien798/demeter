import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/navigator.dart';
import 'package:my_home/utils/widget_utils.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
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
          'Timer',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              push(context, Router.add_timer);
            },
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.add,
              color: Colors.grey.shade700,
              size: scaleWidth(context, 32),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: scaleWidth(context, 24),
            horizontal: scaleWidth(context, 24)),
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'Device will OFF in',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 18)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(scaleWidth(context, 24)),
              child: Text(
                '00:03:59',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: scaleWidth(context, 60),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: scaleWidth(context, 24)),
            _buildCountdownItem('4', true),
            SizedBox(height: scaleWidth(context, 8)),
            _buildCountdownItem('1', false),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdownItem(String remain, bool status) {
    return Container(
      height: scaleWidth(context, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$remain minutes',
                  style: TextStyle(
                      color: Colors.black, fontSize: scaleWidth(context, 24)),
                ),
                Transform.scale(
                  scale: scaleWidth(context, 30) / 39,
                  child: CupertinoSwitch(
                    onChanged: (value) {},
                    activeColor: Colors.green,
                    value: status,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              'Countdown lable\nto ${status ? 'ON' : 'OFF'}',
              style: TextStyle(
                color: Colors.black,
                fontSize: scaleWidth(context, 12),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.8,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
