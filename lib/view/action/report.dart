import 'package:demeter/utils/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demeter/utils/color_utils.dart';
import 'package:demeter/utils/widget_utils.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
          'Report',
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
                padding: EdgeInsets.all(scaleWidth(context, 16)),
                children: <Widget>[
                  _buildOverview(),
                  _buildReportDevice(),
                  _buildReportSensor(),
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
                  'Print PDF Report',
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

  Widget _buildOverview() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 30)),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: RowData(
              height: scaleWidth(context, 32),
              leading: Text(
                'Chart',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 12)),
              ),
              trailing: Row(
                children: <Widget>[
                  Text(
                    'By day',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 12)),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: scaleWidth(context, 14),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: RowData(
              height: scaleWidth(context, 32),
              leading: Text(
                'Start',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 12)),
              ),
              trailing: Row(
                children: <Widget>[
                  Text(
                    'Dec 15, 2018  03:00pm',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 12)),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: scaleWidth(context, 14),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: RowData(
              height: scaleWidth(context, 32),
              leading: Text(
                'End',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 12)),
              ),
              trailing: Row(
                children: <Widget>[
                  Text(
                    '09:00pm',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 12)),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: scaleWidth(context, 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportDevice() {
    return Container(
      margin: EdgeInsets.all(scaleWidth(context, 16)),
      child: Column(
        children: <Widget>[
          Text(
            'Report Device',
            style: TextStyle(
              color: Colors.black,
              fontSize: scaleWidth(context, 17),
            ),
          ),
          _buildDeviceItem(
            ImagePath.dv_light,
            'DFamily',
            'Carot Zone',
            true,
          ),
          _buildDeviceItem(
            ImagePath.dv_light,
            'Fan',
            '',
            false,
          )
        ],
      ),
    );
  }

  Widget _buildReportSensor() {
    return Container(
      margin: EdgeInsets.all(scaleWidth(context, 16)),
      child: Column(
        children: <Widget>[
          Text(
            'Report Device',
            style: TextStyle(
              color: Colors.black,
              fontSize: scaleWidth(context, 17),
            ),
          ),
          _buildDeviceItem(
            ImagePath.dv_light,
            'Temperature',
            'Tomato temperature',
            true,
          ),
          _buildDeviceItem(
            ImagePath.dv_light,
            'Humidity',
            'Tomato humidity',
            true,
          )
        ],
      ),
    );
  }

  Widget _buildDeviceItem(
      String image, String title, String subtitle, bool isSelected) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(image),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: scaleWidth(context, 15),
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: scaleWidth(context, 12),
            ),
          ),
          trailing: Container(
            width: scaleWidth(context, 15),
            height: scaleWidth(context, 15),
            child: isSelected ? _buildSelected() : _buildUnselected(),
          ),
        ),
        buildDivider(),
      ],
    );
  }

  Widget _buildSelected() {
    return RaisedButton(
      padding: EdgeInsets.zero,
      shape: CircleBorder(),
      color: Colors.green,
      onPressed: () {},
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: scaleWidth(context, 12),
      ),
    );
  }

  Widget _buildUnselected() {
    return RaisedButton(
      padding: EdgeInsets.zero,
      shape: CircleBorder(),
      color: Colors.black,
      onPressed: () {},
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: scaleWidth(context, 12),
      ),
    );
  }
}
