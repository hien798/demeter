import 'package:flutter/material.dart';
import 'package:my_home/utils/widget_utils.dart';

final Color selectedColor = Colors.green.shade800;
final Color unselectedColor = Colors.grey.shade600;

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _projects = [
    ProjectType('Agriculture', Icons.local_florist),
    ProjectType('Smart Home', Icons.home),
    ProjectType('Education', Icons.event_note),
    ProjectType('Medical', Icons.favorite_border),
    ProjectType('Industrial', Icons.business),
    ProjectType('Others', Icons.bubble_chart),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeeeeee),
        title: Text(
          'Add Project',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(scaleWidth(context, 24)),
              child: Text(
                'Choose a Project Type',
                style: TextStyle(
                    color: unselectedColor,
                    fontSize: scaleWidth(context, 16),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: scaleWidth(context, 24)),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 80 / 102),
                  itemCount: _projects.length,
                  itemBuilder: (context, index) {
                    final pro = _projects[index];
                    final isSelected = index == _selectedIndex;
                    return FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: scaleWidth(context, 80),
                              width: scaleWidth(context, 80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    scaleWidth(context, 40)),
                                border: Border.all(
                                    width: isSelected ? 4.0 : 2.0,
                                    color: isSelected
                                        ? selectedColor
                                        : unselectedColor),
                              ),
                              child: Icon(
                                pro.icon,
                                color: isSelected
                                    ? selectedColor
                                    : unselectedColor,
                                size: scaleWidth(context, 40),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: scaleWidth(context, 12)),
                                width: scaleWidth(context, 90),
                                alignment: Alignment.center,
                                child: Text(
                                  pro.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: scaleWidth(context, 16),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: scaleWidth(context, 8),
                bottom: scaleWidth(context, 64),
              ),
              child: FlatButton(
                onPressed: () {
                  print('create project');
                },
                child: Text(
                  'Create Project',
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
}

class ProjectType {
  final String title;
  final IconData icon;

  ProjectType(this.title, this.icon);
}
