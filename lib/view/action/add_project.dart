import 'package:flutter/material.dart';
import 'package:demeter/utils/color_utils.dart';
import 'package:demeter/utils/path.dart';
import 'package:demeter/utils/widget_utils.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _projects = [
    ProjectType('Agriculture', ImagePath.ic_plant),
    ProjectType('Smart Home', ImagePath.ic_smart_home),
    ProjectType('Education', ImagePath.ic_mortarboard),
    ProjectType('Medical', ImagePath.ic_heart),
    ProjectType('Industrial', ImagePath.ic_factory),
    ProjectType('Others', ImagePath.ic_smart_energy),
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
                              child: Center(
                                child: Container(
                                  child: ImageIcon(
                                    AssetImage(pro.icon),
                                    color: isSelected
                                        ? selectedColor
                                        : unselectedColor,
                                    size: scaleWidth(context, 40),
                                  ),
                                ),
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
                                    fontSize: scaleWidth(context, 15),
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
  final String icon;

  ProjectType(this.title, this.icon);
}
