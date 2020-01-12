import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

class Sensor extends StatefulWidget {
  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
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
          'Plugin Sensor',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(scaleWidth(context, 24)),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                height: scaleWidth(context, 175),
                margin: EdgeInsets.only(
                    top: index == 0 ? 0 : scaleWidth(context, 24)),
                child: _buildCountdownItem('Temperature', 'Tomato temperature',
                    true, Icons.bluetooth, 'By day'),
              );
            }),
      ),
    );
  }

  Widget _buildCountdownItem(
      String name, String label, bool status, IconData icon, String chart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: scaleWidth(context, 12)),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: scaleWidth(context, 18),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Status',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 16)),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Label',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 16)),
              ),
              Text(
                label,
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 16)),
              ),
            ],
          ),
        ),
        _buildDevider(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Icon',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 16)),
              ),
              Row(
                children: <Widget>[
                  Icon(icon, color: Colors.red),
                  Icon(Icons.chevron_right, color: Colors.black)
                ],
              )
            ],
          ),
        ),
        _buildDevider(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Chart',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 16)),
              ),
              Text(
                'By day',
                style: TextStyle(
                    color: Colors.black, fontSize: scaleWidth(context, 16)),
              ),
            ],
          ),
        ),
        _buildDevider(),
      ],
    );
  }

  Widget _buildDevider() {
    return Container(
      width: double.infinity,
      height: 0.8,
      color: Colors.grey,
    );
  }
}
