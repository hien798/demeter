import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/utils/color_utils.dart';
import 'package:my_home/utils/path.dart';
import 'package:my_home/utils/widget_utils.dart';

class EditProject extends StatefulWidget {
  @override
  _EditProjectState createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
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
          'Edit Project',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey.shade700,
              size: scaleWidth(context, 32),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(scaleWidth(context, 12)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(scaleWidth(context, 12)),
              child: Column(
                children: <Widget>[
                  Container(
                    width: scaleWidth(context, 80),
                    height: scaleWidth(context, 80),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(scaleWidth(context, 8)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/farm.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(scaleWidth(context, 28)),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        padding: EdgeInsets.zero,
                        shape: CircleBorder(),
                        onPressed: () {},
                        child: ImageIcon(
                          AssetImage(ImagePath.ic_add),
                          color: Colors.black54,
                          size: scaleWidth(context, 28),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: scaleWidth(context, 12)),
                  RowData(
                    height: scaleWidth(context, 44),
                    title: Center(
                      child: Text(
                        'Project Infomation',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    hasUnderLine: false,
                  ),
                  SizedBox(height: scaleWidth(context, 12)),
                  RowData(
                    height: scaleWidth(context, 44),
                    leading: Text(
                      'Project Type',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: scaleWidth(context, 15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      'Smart Home',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: scaleWidth(context, 15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    hasUnderLine: false,
                  ),
                  RowData(
                    leading: Text(
                      'Project Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: scaleWidth(context, 15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Text(
                      'Living Room',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: scaleWidth(context, 15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Add Device',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: scaleWidth(context, 17),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: scaleWidth(context, 24)),
            Expanded(
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: scaleWidth(context, 12)),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _buildDeviceItem(
                        'assets/images/light.jpg',
                        'DFamily',
                        'Carot Zone',
                        index % 3 == 0,
                      );
                    },
                  ),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black12, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: scaleWidth(context, 24)),
              child: Text(
                '2 selected',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: scaleWidth(context, 15),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: scaleWidth(context, 8),
                bottom: scaleWidth(context, 48),
              ),
              child: FlatButton(
                onPressed: () {
                  print('create project');
                },
                child: Text(
                  'Save Project',
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

  Widget _buildDeviceItem(
      String image, String title, String subtitle, bool isSelected) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(image),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: scaleWidth(context, 15),
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: scaleWidth(context, 12),
            ),
          ),
          trailing: Container(
            width: scaleWidth(context, 15),
            height: scaleWidth(context, 15),
            child: isSelected ? _buildSelected() : _buildUnselected(),
          ),
        ),
        buildDivider(),
      ],
    );
  }

  Widget _buildSelected() {
    return Container(
      width: scaleWidth(context, 16),
      height: scaleWidth(context, 16),
      child: RaisedButton(
        padding: EdgeInsets.zero,
        shape: CircleBorder(),
        color: Colors.white,
        onPressed: () {},
        child: ImageIcon(
          AssetImage(ImagePath.ic_check_mark),
          color: Colors.green,
          size: scaleWidth(context, 16),
        ),
      ),
    );
  }

  Widget _buildUnselected() {
    return Container(
      width: scaleWidth(context, 16),
      height: scaleWidth(context, 16),
      child: RaisedButton(
        padding: EdgeInsets.zero,
        shape: CircleBorder(),
        color: Colors.white,
        onPressed: () {},
        child: ImageIcon(
          AssetImage(ImagePath.ic_add),
          color: Colors.black,
          size: scaleWidth(context, 16),
        ),
      ),
    );
  }
}
