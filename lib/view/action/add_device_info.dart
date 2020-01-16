import 'package:flutter/material.dart';
import 'package:my_home/utils/color_utils.dart';
import 'package:my_home/utils/navigator.dart';
import 'package:my_home/utils/widget_utils.dart';

class AddDeviceInfo extends StatefulWidget {
  @override
  _AddDeviceInfoState createState() => _AddDeviceInfoState();
}

class _AddDeviceInfoState extends State<AddDeviceInfo> {
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
          'Add Mi Plug Mini54c0',
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(scaleWidth(context, 24)),
                children: <Widget>[
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
            ),
            Container(
              padding: EdgeInsets.only(
                top: scaleWidth(context, 8),
                bottom: scaleWidth(context, 64),
              ),
              child: FlatButton(
                onPressed: () {
                  push(context, Router.select_wifi);
                },
                child: Text(
                  'Next',
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
