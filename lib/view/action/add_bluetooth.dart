import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/color_utils.dart';
import 'package:my_home/utils/navigator.dart';
import 'package:my_home/utils/widget_utils.dart';

class AddBluetooth extends StatefulWidget {
  @override
  _AddBluetoothState createState() => _AddBluetoothState();
}

class _AddBluetoothState extends State<AddBluetooth> {
  @override
  void initState() {
    super.initState();
  }

  final devices = [
    'Mi Plug Mini54c0',
    'Xiaomi Mi 9 SE',
    'VinLight',
    'Mi Plug Mini54c0',
    'Xiaomi Mi 9 SE',
    'VinLight',
    'Mi Plug Mini54c0',
    'Xiaomi Mi 9 SE',
    'VinLight'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeeeeee),
        title: Text(
          'Nearby Bluetooth Devices',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: scaleWidth(context, 16)),
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final dv = devices[index];
                  return Container(
                    child: _buildBluetoothItem(dv, 'assets/images/switch.jpg'),
                  );
                },
              ),
            ),
            SizedBox(height: scaleWidth(context, 16)),
            devices.length > 0
                ? CircularProgressIndicator()
                : Container(
                    padding: EdgeInsets.only(
                      top: scaleWidth(context, 16),
                    ),
                    child: Text(
                      'No Bluetooth Devices Found',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: scaleWidth(context, 15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
            Container(
              padding: EdgeInsets.only(
                top: scaleWidth(context, 16),
              ),
              child: FlatButton(
                onPressed: () {
                  print('create project');
                },
                child: Text(
                  'Try Again',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: scaleWidth(context, 17),
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
                  'Can\'t Find?',
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

  Widget _buildBluetoothItem(String name, String image) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            push(context, Router.add_device_info);
          },
          title: Text(
            name,
            style: TextStyle(
              color: unselectedColor,
              fontSize: scaleWidth(context, 17),
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            'Add',
            style: TextStyle(
              color: selectedColor,
              fontSize: scaleWidth(context, 17),
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.all(scaleWidth(context, 8)),
            child: Image.asset(image),
          ),
        ),
        buildDivider(),
      ],
    );
  }
}
