import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demeter/utils/color_utils.dart';
import 'package:demeter/utils/navigator.dart';
import 'package:demeter/utils/widget_utils.dart';

class SelectWifi extends StatefulWidget {
  @override
  _SelectWifiState createState() => _SelectWifiState();
}

class _SelectWifiState extends State<SelectWifi> {
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
          'Select Wifi Network',
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
                  InkWell(
                    onTap: () {},
                    child: RowData(
                      leading: Text(
                        'D-SHOWCASE',
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
                              'Login',
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
                  InkWell(
                    onTap: () {},
                    child: RowData(
                      leading: Text(
                        'Other...',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: scaleWidth(context, 16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      hasUnderLine: false,
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
                  push(context, Router.register_device);
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
