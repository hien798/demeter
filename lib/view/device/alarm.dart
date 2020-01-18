import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demeter/utils/navigator.dart';
import 'package:demeter/utils/widget_utils.dart';

class Alarm extends StatefulWidget {
  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
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
          'Alarm',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              push(context, Router.add_alarm);
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
                'Now',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 18)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: scaleWidth(context, 24)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    child: Text(
                      '30:30',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: scaleWidth(context, 60),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'PM',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: scaleWidth(context, 20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildAlarmItem(true),
            SizedBox(height: scaleWidth(context, 8)),
            _buildAlarmItem(false),
          ],
        ),
      ),
    );
  }

  Widget _buildAlarmItem(bool status) {
    return Container(
      height: scaleWidth(context, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '09:00',
                        style: TextStyle(
                          color: status ? Colors.black : Colors.grey,
                          fontSize: scaleWidth(context, 18),
                        ),
                      ),
                      TextSpan(
                        text: 'AM',
                        style: TextStyle(
                          color: status ? Colors.black : Colors.grey,
                          fontSize: scaleWidth(context, 10),
                        ),
                      ),
                      TextSpan(
                        text: ' - ',
                        style: TextStyle(
                          color: status ? Colors.black : Colors.grey,
                          fontSize: scaleWidth(context, 18),
                        ),
                      ),
                      TextSpan(
                        text: '03:00',
                        style: TextStyle(
                          color: status ? Colors.black : Colors.grey,
                          fontSize: scaleWidth(context, 18),
                        ),
                      ),
                      TextSpan(
                        text: 'PM',
                        style: TextStyle(
                          color: status ? Colors.black : Colors.grey,
                          fontSize: scaleWidth(context, 10),
                        ),
                      ),
                    ],
                  ),
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
              status ? 'Everyday\nNighttime' : 'Weekends\nDaytime',
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
