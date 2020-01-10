import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Home'),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'My Devices'),
            Tab(text: 'My Projects')
          ],
        ),
      ),
      body: Container(),
    );
  }
}
