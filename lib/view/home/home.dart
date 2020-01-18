import 'package:flutter/material.dart';
import 'package:demeter/utils/widget_utils.dart';
import 'package:demeter/view/home/my_devices.dart';
import 'package:demeter/view/home/my_project.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: scaleHeight(context, 36),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 6),
            tabs: <Widget>[
              Tab(
                child: Text(
                  'My Devices',
                  style: TextStyle(fontSize: scaleWidth(context, 16)),
                ),
              ),
              Tab(
                child: Text(
                  'My Projects',
                  style: TextStyle(fontSize: scaleWidth(context, 16)),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              MyDevice(),
              MyProject(),
            ],
          ),
        ),
      ],
    );
  }
}
