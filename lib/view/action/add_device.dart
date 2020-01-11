import 'package:flutter/material.dart';
import 'package:my_home/utils/pinned_side_menu.dart';
import 'package:my_home/utils/widget_utils.dart';

class AddDevice extends StatefulWidget {
  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> with TickerProviderStateMixin {
  TabController _tabController;
  final _categories = [
    'Power Switch',
    'Nutrient Controller',
    'Sensor',
    'Camera'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _categories.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeeeeee),
        title: Text(
          'Add Device',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: Icon(Icons.bluetooth, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: ImageIcon(
              AssetImage('assets/images/ic_qr.png'),
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(8),
            ),
            height: scaleWidth(context, 32),
            child: TextField(
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: scaleWidth(context, 18),
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: scaleWidth(context, 18),
                  fontWeight: FontWeight.w300,
                ),
                contentPadding: EdgeInsets.all(scaleWidth(context, 7)),
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: scaleWidth(context, 24)),
              child: Row(
                children: <Widget>[
                  Container(
                    width: scaleWidth(context, 92),
                    child: PinnedSideMenu(
                      controller: _tabController,
                      titles: _categories,
                      itemHeight: scaleWidth(context, 64),
                      leftSpace: 12,
                      selectedStyle: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 16)),
                      unselectedStyle: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 16)),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: _categories.map((cat) {
                        return Text(
                          'cat $cat',
                          style: TextStyle(color: Colors.black),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
