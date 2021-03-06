import 'package:demeter/bloc/base/bloc_providers.dart';
import 'package:demeter/bloc/home/home_bloc.dart';
import 'package:demeter/utils/path.dart';
import 'package:flutter/material.dart';
import 'package:demeter/utils/navigator.dart';
import 'package:demeter/utils/widget_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyProject extends StatefulWidget {
  final parentBloc;

  MyProject({Key key, this.parentBloc}) : super(key: key);

  @override
  _MyProjectState createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject>
    with AutomaticKeepAliveClientMixin {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget.parentBloc;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        itemBuilder: (context, index) {
          final project = _bloc.projects[index];
          return InkWell(
            onTap: () {
              _bloc.projectIndex = index;
              _bloc.changeLayout(LayoutType.detail);
            },
            child: Container(
              height: size.width / 3.5,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(project.image, fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  project.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: scaleWidth(context, 16),
                                  ),
                                ),
                                Text(
                                  '69%',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: scaleWidth(context, 15),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: LinearPercentIndicator(
                                percent: 0.69,
                                padding: EdgeInsets.all(5),
                                lineHeight: scaleWidth(context, 10),
                                progressColor: Colors.green,
                                backgroundColor: Colors.grey.withOpacity(0.3),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Start date  ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: scaleWidth(context, 15)),
                                ),
                                Text(
                                  '15/12/2018',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: scaleWidth(context, 15)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'End date  ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: scaleWidth(context, 15)),
                                    ),
                                    Text(
                                      '31/12/2018',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: scaleWidth(context, 15)),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: scaleWidth(context, 18),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Text(
                                    '8 days left',
                                    style: TextStyle(
                                      fontSize: scaleWidth(context, 13),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _bloc.projects.length,
      ),
    );
  }

  Widget _buildEmpty() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Container(
          width: double.infinity,
          height: scaleWidth(context, 64),
          margin: EdgeInsets.symmetric(
              vertical: scaleWidth(context, 64), horizontal: 16),
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              'Add Project',
              style: TextStyle(fontSize: scaleWidth(context, 16)),
            ),
            color: Colors.white.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
