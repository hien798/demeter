import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/color_utils.dart';
import 'package:my_home/utils/navigator.dart';
import 'package:my_home/utils/widget_utils.dart';

class AddAlarm extends StatefulWidget {
  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
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
          'Add Alarm',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(scaleWidth(context, 24)),
                children: <Widget>[
                  RowData(
                    leading: Text(
                      'Turn ON',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 16)),
                    ),
                    trailing: Text(
                      '03:00 AM',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 16)),
                    ),
                  ),
                  RowData(
                    leading: Text(
                      'Turn OFF',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 16)),
                    ),
                    trailing: Text(
                      '09:00 AM',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 16)),
                    ),
                  ),
                  RowData(
                    leading: Text(
                      'Delete after goes off',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 16)),
                    ),
                    trailing: Transform.scale(
                      scale: scaleWidth(context, 30) / 39,
                      child: CupertinoSwitch(
                        onChanged: (value) {},
                        value: true,
                        activeColor: selectedColor,
                      ),
                    ),
                    hasUnderLine: false,
                  ),
                  RowData(
                    leading: Text(
                      'Alarm label',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 16)),
                    ),
                    trailing: Text(
                      'Type',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: scaleWidth(context, 16),
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      push(context, Router.alarm_repeat);
                    },
                    child: RowData(
                      leading: Text(
                        'Repeat',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: scaleWidth(context, 16)),
                      ),
                      trailing: Container(
                        width: scaleWidth(context, 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Never',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: scaleWidth(context, 16)),
                            ),
                            Icon(Icons.chevron_right, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: scaleWidth(context, 8),
                bottom: scaleWidth(context, 64),
              ),
              child: FlatButton(
                onPressed: () {
                  pop(context);
                },
                child: Text(
                  'Save Alarm',
                  style: TextStyle(
                    color: selectedColor,
                    fontSize: scaleWidth(context, 17),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
