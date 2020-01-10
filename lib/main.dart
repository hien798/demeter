import 'package:flutter/material.dart';
import 'package:my_home/view/home/dash.dart';
import 'package:my_home/view/home/home.dart';
import 'package:my_home/view/login/login.dart';
import 'package:my_home/view/login/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: Dashboard(),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('My Home'),
//      ),
//      body: Container(
//        child: Center(child: Text('IOIOIOI'),),
//      ),
//    );
//  }
//}

