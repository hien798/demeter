import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

class AlarmRepeat extends StatefulWidget {
  @override
  _AlarmRepeatState createState() => _AlarmRepeatState();
}

class _AlarmRepeatState extends State<AlarmRepeat> {
  @override
  void initState() {
    super.initState();
  }

  final days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeeeeee),
        title: Text(
          'Repeat',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(scaleWidth(context, 24)),
            itemCount: days.length,
            itemBuilder: (context, index) {
              return RowData(
                leading: Text(
                  'Every ${days[index]}',
                  style: TextStyle(
                      color: Colors.black, fontSize: scaleWidth(context, 15)),
                ),
                trailing: Container(
                  width: scaleWidth(context, 15),
                  height: scaleWidth(context, 15),
                  child: index == 0 ? _buildSelected() : _buildUnselected(),
                ),
              );
            }),
      ),
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
