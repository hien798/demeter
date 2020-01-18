import 'package:demeter/bloc/home/home_bloc.dart';
import 'package:demeter/model/project.dart';
import 'package:demeter/utils/navigator.dart';
import 'package:demeter/utils/path.dart';
import 'package:demeter/utils/widget_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProjectInfo extends StatefulWidget {
  final HomeBloc parentBloc;

  ProjectInfo({Key key, this.parentBloc}) : super(key: key);

  @override
  _ProjectInfoState createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  @override
  void initState() {
    super.initState();
//    _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      padding: EdgeInsets.all(scaleWidth(context, 12)),
      child: Column(
        children: <Widget>[
          _buildOverview(),
          SizedBox(height: scaleWidth(context, 12)),
          buildDivider(),
          SizedBox(height: scaleWidth(context, 12)),
          _buildCamera(),
          SizedBox(height: scaleWidth(context, 12)),
          buildDivider(),
          SizedBox(height: scaleWidth(context, 12)),
          _buildDFamily(),
          SizedBox(height: scaleWidth(context, 12)),
          buildDivider(),
          SizedBox(height: scaleWidth(context, 12)),
          _buildChart(),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    final project = widget.parentBloc.projects[widget.parentBloc.projectIndex];
    return Container(
      height: scaleWidth(context, 90),
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
              child: Image.asset(project?.image ?? ImagePath.dv_farm, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: scaleWidth(context, 9)),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          project?.name ?? 'Tomato',
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
    );
  }

  Widget _buildCamera() {
    return Container(
      height: scaleWidth(context, 90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
//            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(ImagePath.dv_light),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Transform.scale(
                            scale: scaleWidth(context, 30) / 39,
                            child: CupertinoSwitch(
                              value: true,
                              activeColor: Colors.green,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Camera',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: scaleWidth(context, 16),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'On',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: scaleWidth(context, 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 32),
          Expanded(
//            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(ImagePath.dv_farm),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(scaleWidth(context, 20)),
                        child: Container(
                          width: scaleWidth(context, 40),
                          height: scaleWidth(context, 40),
                          color: Colors.green,
                          child: Center(
                            child: Container(
                              width: scaleWidth(context, 30),
                              height: scaleWidth(context, 30),
                              child: InkWell(
                                onTap: () {},
                                child: Image.asset(ImagePath.ic_play_button),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDFamily() {
    return Container(
      height: scaleWidth(context, 90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              width: scaleWidth(context, 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              push(context, Router.dfamily);
                            },
                            child: Image.asset(ImagePath.dv_light)),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Transform.scale(
                              scale: scaleWidth(context, 30) / 39,
                              child: CupertinoSwitch(
                                value: true,
                                activeColor: Colors.green,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'DFamily',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: scaleWidth(context, 16),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'On',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: scaleWidth(context, 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
//          SizedBox(width: 16),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: scaleWidth(context, 100),
                    height: scaleWidth(context, 90) / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Light',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: scaleWidth(context, 16),
                          ),
                        ),
                        Container(
                          width: scaleWidth(context, 90) / 2,
                          child: Transform.scale(
                            scale: scaleWidth(context, 30) / 39,
                            child: CupertinoSwitch(
                              // width 59, height 39
                              value: true,
                              activeColor: Colors.green,
                              onChanged: (value) {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: scaleWidth(context, 100),
                    height: scaleWidth(context, 90) / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Pump',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: scaleWidth(context, 16),
                          ),
                        ),
                        Container(
                          width: scaleWidth(context, 90) / 2,
                          child: Transform.scale(
                            scale: scaleWidth(context, 30) / 39,
                            child: CupertinoSwitch(
                              value: false,
                              activeColor: Colors.green,
                              onChanged: (value) {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: scaleWidth(context, 100),
                    height: scaleWidth(context, 90) / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Fan',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: scaleWidth(context, 16),
                          ),
                        ),
                        Container(
                          width: scaleWidth(context, 90) / 2,
                          child: Transform.scale(
                            scale: scaleWidth(context, 30) / 39,
                            child: CupertinoSwitch(
                              value: true,
                              activeColor: Colors.green,
                              onChanged: (value) {},
                            ),
                          ),
                        )
                      ],
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

  Widget _buildChart() {
    return Container(
      height: scaleWidth(context, 90),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: scaleWidth(context, 30),
                      child: Image.asset(ImagePath.ic_themometer),
                    ),
                    Text(
                      '20.1',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 22)),
                    ),
                    Text(
                      '℃',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Expanded(
                  child: _buildTemperatureLineChart(),
                ),
              ],
            ),
          ),
          SizedBox(width: scaleWidth(context, 12)),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '80.6',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleWidth(context, 22)),
                    ),
                    Text(
                      '%',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: scaleWidth(context, 30),
                      child: Image.asset(ImagePath.ic_water),
                    ),
                  ],
                ),
                Expanded(
                  child: _buildWaterLineChart(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>>
      _createSampleWaterData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  static List<charts.Series<TimeSeriesSales, DateTime>>
      _createSampleTemperatureData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  Widget _buildTemperatureLineChart() {
    return charts.TimeSeriesChart(
      _createSampleTemperatureData(),
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  Widget _buildWaterLineChart() {
    return charts.TimeSeriesChart(
      _createSampleWaterData(),
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
