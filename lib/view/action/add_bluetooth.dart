import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Container(),
    );
  }
}
