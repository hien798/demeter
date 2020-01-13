import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

class DFamily extends StatefulWidget {
  @override
  _DFamilyState createState() => _DFamilyState();
}

class _DFamilyState extends State<DFamily> {
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
          'DFamily',
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
      body: Container(
        padding: EdgeInsets.all(scaleWidth(context, 24)),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                child: _buildDevice('Pump $index'),
              );
            }),
      ),
    );
  }

  Widget _buildDevice(String name) {
    return Container(
      height: scaleWidth(context, 215),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: scaleWidth(context, 16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 24)),
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.grey.shade700,
                    size: scaleWidth(context, 32),
                  ),
                ),
              ),
              Container(
                width: scaleWidth(context, 80),
                height: scaleWidth(context, 80),
                margin: EdgeInsets.all(scaleWidth(context, 8)),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pump.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(scaleWidth(context, 8))),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 24)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: _buildPumpDevice('History', Icons.history)),
                  Expanded(child: _buildPumpDevice('Timer', Icons.timer)),
                  Expanded(child: _buildPumpDevice('Alarm', Icons.alarm)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPumpDevice(String name, IconData icon) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: scaleWidth(context, 48),
            height: scaleWidth(context, 48),
            child: OutlineButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              borderSide: BorderSide(color: Colors.grey),
              shape: CircleBorder(),
              child: Container(
                  child: Icon(
                icon,
                color: Colors.black,
                size: scaleWidth(context, 30),
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
