import 'package:flutter/material.dart';
import 'package:my_home/utils/color_utils.dart';
import 'package:my_home/utils/navigator.dart';
import 'package:my_home/view/action/add_alarm.dart';
import 'package:my_home/view/action/add_bluetooth.dart';
import 'package:my_home/view/action/add_device.dart';
import 'package:my_home/view/action/add_device_info.dart';
import 'package:my_home/view/action/add_timer.dart';
import 'package:my_home/view/action/alarm_repeat.dart';
import 'package:my_home/view/action/automation.dart';
import 'package:my_home/view/action/edit_project.dart';
import 'package:my_home/view/action/register_device.dart';
import 'package:my_home/view/action/scan_qr.dart';
import 'package:my_home/view/action/select_wifi.dart';
import 'package:my_home/view/device/alarm.dart';
import 'package:my_home/view/device/device_info.dart';
import 'package:my_home/view/device/dfamily.dart';
import 'package:my_home/view/device/history.dart';
import 'package:my_home/view/device/pump.dart';
import 'package:my_home/view/device/sensor.dart';
import 'package:my_home/view/device/timer.dart';
import 'package:my_home/view/home/dash.dart';
import 'package:my_home/view/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: selectedColor),
//          color: Colors.red,
        ),
      ),
      home: Dashboard(),
      routes: <String, WidgetBuilder>{
        Router.login: (context) => LoginPage(),
        Router.dash: (context) => Dashboard(),
        Router.dfamily: (context) => DFamily(),
        Router.add_device: (context) => AddDevice(),
        Router.edit_project: (context) => EditProject(),
        Router.history: (context) => History(),
        Router.timer: (context) => Timer(),
        Router.alarm: (context) => Alarm(),
        Router.add_device_info: (context) => AddDeviceInfo(),
        Router.add_bluetooth: (context) => AddBluetooth(),
        Router.scan_qr: (context) => ScanQR(),
        Router.add_timer: (context) => AddTimer(),
        Router.add_alarm: (context) => AddAlarm(),
        Router.alarm_repeat: (context) => AlarmRepeat(),
        Router.select_wifi: (context) => SelectWifi(),
        Router.register_device: (context) => RegisterDevice(),
        Router.device_info: (context) => DeviceInfo(),
        Router.automation: (context) => Automation(),
        Router.pump: (context) => Pump(),
        Router.sensor: (context) => Sensor(),
      },
    );
  }
}
