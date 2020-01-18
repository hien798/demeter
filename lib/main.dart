import 'package:flutter/material.dart';
import 'package:demeter/utils/color_utils.dart';
import 'package:demeter/utils/navigator.dart';
import 'package:demeter/view/action/add_alarm.dart';
import 'package:demeter/view/action/add_bluetooth.dart';
import 'package:demeter/view/action/add_device.dart';
import 'package:demeter/view/action/add_device_info.dart';
import 'package:demeter/view/action/add_project.dart';
import 'package:demeter/view/action/add_timer.dart';
import 'package:demeter/view/action/alarm_repeat.dart';
import 'package:demeter/view/action/automation.dart';
import 'package:demeter/view/action/edit_project.dart';
import 'package:demeter/view/action/register_device.dart';
import 'package:demeter/view/action/scan_qr.dart';
import 'package:demeter/view/action/select_wifi.dart';
import 'package:demeter/view/device/alarm.dart';
import 'package:demeter/view/device/device_info.dart';
import 'package:demeter/view/device/dfamily.dart';
import 'package:demeter/view/device/history.dart';
import 'package:demeter/view/device/pump.dart';
import 'package:demeter/view/device/sensor.dart';
import 'package:demeter/view/device/timer.dart';
import 'package:demeter/view/home/dash.dart';
import 'package:demeter/view/login/login.dart';

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
        Router.add_project: (context) => AddProject(),
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
