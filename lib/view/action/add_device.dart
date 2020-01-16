import 'package:flutter/material.dart';
import 'package:my_home/utils/navigator.dart';
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
            onPressed: () {
              push(context, Router.add_bluetooth);
            },
            padding: EdgeInsets.zero,
            icon: Icon(Icons.bluetooth, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              push(context, Router.scan_qr);
            },
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
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: _categories.map((cat) {
                        return _buildCategory();
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

  Widget _buildCategory() {
    final size = MediaQuery.of(context).size;
    final cats = ['Wifi Switch', '3G Switch'];
    return Container(
      padding: EdgeInsets.all(32),
      child: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          return Container(
            height: scaleWidth(context, 160),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 0.3,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '   ${cats[index]}   ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Container(
                        height: 0.3,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: scaleWidth(context, 140),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, idx) {
                      return Container(
                        width: scaleWidth(context, 60),
                        height: scaleWidth(context, 140),
                        margin: EdgeInsets.only(
                            left: idx == 0 ? 0 : scaleWidth(context, 20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                push(context, Router.add_device_info);
                              },
                              child: Container(
                                width: scaleWidth(context, 40),
                                height: scaleWidth(context, 40),
                                margin: EdgeInsets.symmetric(
                                    vertical: scaleWidth(context, 10)),
                                child: Image.asset('assets/images/switch.jpg'),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Wifi Socketttttttttttxxx',
                                style: TextStyle(color: Colors.grey),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
