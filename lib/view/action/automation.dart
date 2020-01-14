import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/color_utils.dart';
import 'package:my_home/utils/widget_utils.dart';

class Automation extends StatefulWidget {
  @override
  _AutomationState createState() => _AutomationState();
}

class _AutomationState extends State<Automation> {
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
          'Automation',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(scaleWidth(context, 16)),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _buildChart();
                  }),
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
                  'Report',
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

  Widget _buildChart() {
    return Container(
      margin: EdgeInsets.all(scaleWidth(context, 12)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Icon(
                          Icons.watch,
                          color: Colors.red,
                          size: scaleWidth(context, 32),
                        ),
                        title: Text(
                          '20℃',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scaleWidth(context, 28)),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(scaleWidth(context, 16)),
                  child: Center(
                    child: Text(
                      'Chart here',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'By hour  |  ',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'By day',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                '  |  By month',
                style: TextStyle(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
