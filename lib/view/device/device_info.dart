import 'package:flutter/material.dart';
import 'package:my_home/utils/color_utils.dart';
import 'package:my_home/utils/widget_utils.dart';

class DeviceInfo extends StatefulWidget {
  @override
  _DeviceInfoState createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
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
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(scaleWidth(context, 24)),
              width: scaleWidth(context, 124),
              height: scaleWidth(context, 124),
              child: Image.asset('assets/images/switch.jpg'),
            ),
            Expanded(
              child: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: scaleWidth(context, 24)),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RowData(
                        title: Center(
                          child: Text(
                            'Device Infomation',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 17),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        hasUnderLine: false,
                      ),
                      RowData(
                        leading: Text(
                          'Type',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                        trailing: Text(
                          'Wifi Socket',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                      ),
                      RowData(
                        leading: Text(
                          'Serial',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                        trailing: Text(
                          '563A678',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                      ),
                      RowData(
                        leading: Text(
                          'Producer',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                        trailing: Text(
                          'Xiaomi',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: scaleWidth(context, 12)),
                  Column(
                    children: <Widget>[
                      RowData(
                        title: Center(
                          child: Text(
                            'Device Setup',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 17),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        hasUnderLine: false,
                      ),
                      RowData(
                        leading: Text(
                          'Device Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                        trailing: Text(
                          'Wifi Socket',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                      ),
                      RowData(
                        leading: Text(
                          'Project',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                        trailing: Text(
                          'Add to project',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                      ),
                      RowData(
                        leading: Text(
                          'Note',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                        trailing: Text(
                          '',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 16)),
                        ),
                      ),
                    ],
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
                  print('create project');
                },
                child: Text(
                  'Save Setting',
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
