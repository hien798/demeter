import 'package:flutter/material.dart';

class Router {
  static const login = 'login';
  static const dash = 'dash';
  static const dfamily = 'dfamily';
  static const add_device = 'add_device';
  static const add_project = 'add_project';
  static const edit_project = 'edit_project';
  static const history = 'history';
  static const timer = 'timer';
  static const alarm = 'alarm';
  static const add_device_info = 'add_device_info';
  static const add_bluetooth = 'add_bluetooth';
  static const scan_qr = 'scan_qr';
  static const add_timer = 'add_timer';
  static const add_alarm = 'add_alarm';
  static const alarm_repeat = 'alarm_repeat';
  static const select_wifi = 'select_wifi';
  static const register_device = 'register_device';
  static const device_info = 'device_info';
  static const automation = 'automation';
  static const report = 'report';
  static const pump = 'pump';
  static const sensor = 'sensor';
}

void pushAndRemoveUntil(BuildContext context, String routeName,
    {double delay = 1.0, void Function<T>(T value) callback}) {
  Navigator.pushNamedAndRemoveUntil(context, routeName, (rt) => false)
      .then((value) {
    if (value != null && callback != null) callback(value);
  });
}

void push(BuildContext context, String routeName,
    {Object arguments,
    double delay = 1.0,
    void Function<T>(T value) callback}) {
  Navigator.pushNamed(context, routeName, arguments: arguments).then((value) {
    if (value != null && callback != null) callback(value);
  });
}

void pop(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}
