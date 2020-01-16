import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/navigator.dart';
import 'package:my_home/utils/path.dart';
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
                padding:
                    EdgeInsets.symmetric(horizontal: scaleWidth(context, 24)),
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    _showBottomSheet(name);
                  },
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
                    borderRadius:
                        BorderRadius.circular(scaleWidth(context, 8))),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: scaleWidth(context, 24)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: _buildPumpDevice('History', ImagePath.ic_history)),
                  Expanded(child: _buildPumpDevice('Timer', ImagePath.ic_timer)),
                  Expanded(child: _buildPumpDevice('Alarm', ImagePath.ic_clock)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPumpDevice(String name, String icon) {
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
                  child: ImageIcon(
                AssetImage(icon),
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

  void _showBottomSheet(String name) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (ctx) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: ImageIcon(AssetImage(ImagePath.ic_line_chart), color: Colors.black),
                  title: Text(
                    'Automation',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 16)),
                  ),
                  onTap: () {
                    push(context, Router.automation);
                  },
                ),
                ListTile(
                  leading: ImageIcon(AssetImage(ImagePath.ic_share), color: Colors.black),
                  title: Text(
                    'Share Device',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 16)),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: ImageIcon(AssetImage(ImagePath.ic_remote_control), color: Colors.black),
                  title: Text(
                    'General Setting',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 16)),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading:
                  ImageIcon(AssetImage(ImagePath.ic_socket), color: Colors.black),
                  title: Text(
                    'Plugin Sensor',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 16)),
                  ),
                  onTap: () {
                    push(context, Router.sensor);
                  },
                ),
                ListTile(
                  leading: ImageIcon(AssetImage(ImagePath.ic_question), color: Colors.black),
                  title: Text(
                    'Help',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 16)),
                  ),
                  onTap: () {},
                ),
                Container(
                  height: 0.5,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.close, color: Colors.black),
                  title: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black, fontSize: scaleWidth(context, 16)),
                  ),
                  onTap: () {
                    pop(context);
                  },
                ),
                Container(
                  height: 34,
                ), // safe area padding bottom
              ],
            ),
          );
        });
  }
}
