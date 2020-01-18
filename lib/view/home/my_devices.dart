import 'package:demeter/bloc/base/bloc_providers.dart';
import 'package:demeter/bloc/home/home_bloc.dart';
import 'package:demeter/model/camera.dart';
import 'package:demeter/model/device.dart';
import 'package:demeter/model/dfamily.dart';
import 'package:demeter/view/device/dfamily.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demeter/utils/navigator.dart';
import 'package:demeter/utils/path.dart';
import 'package:demeter/utils/widget_utils.dart';

class MyDevice extends StatefulWidget {
  @override
  _MyDeviceState createState() => _MyDeviceState();
}

class _MyDeviceState extends State<MyDevice>
    with AutomaticKeepAliveClientMixin {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: _buildDevices(),
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
              'Add Device',
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

  Widget _buildDevices() {
    final devices = _bloc.devices.sublist(0, 3);
    final device = _bloc.devices.last;
    final dfamily = _bloc.dfamily;
    final camera = _bloc.camera;
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: 8, vertical: scaleWidth(context, 24)),
      children: <Widget>[
        Row(
          children: devices.map((dv) => _buildSmallDevice(dv)).toList(),
        ),
        Row(
          children: <Widget>[
            _buildMediumDevice(dfamily),
            _buildSmallDevice(device),
          ],
        ),
        Row(
          children: <Widget>[
            _buildLargeDevice(camera),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallDevice(Device device) {
    final size = MediaQuery.of(context).size;
    final width = (size.width - 16 * 4) / 3;
    final switchScale = (width / 4) / 39; // height of switch 39
    return Container(
      width: width,
      height: width,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        push(context, Router.pump, arguments: device);
                      },
                      child: Container(
                          padding: EdgeInsets.all(scaleWidth(context, 4)),
                          child: Image.asset(device.image))),
                ),
                Expanded(
                  flex: 1,
                  child: Transform.scale(
                    scale: switchScale,
                    child: CupertinoSwitch(
                      value: device.status,
                      activeColor: Colors.green,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                device.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: scaleWidth(context, 16),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                device.desc,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: scaleWidth(context, 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediumDevice(DFamily dFamily) {
    final size = MediaQuery.of(context).size;
    final width = (size.width - 16 * 4) / 3;
    final switchScale = (width / 4) / 39; // height of switch 39
    return Container(
      width: width * 2 + 16,
      height: width,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              push(context, Router.dfamily);
                            },
                            child: Container(
                                padding: EdgeInsets.all(scaleWidth(context, 4)),
                                child: Image.asset(dFamily.image))),
                      ),
                      Expanded(
                        flex: 1,
                        child: Transform.scale(
                          scale: switchScale,
                          child: CupertinoSwitch(
                            value: dFamily.status,
                            activeColor: Colors.green,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      dFamily.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: scaleWidth(context, 16),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      dFamily.desc,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: scaleWidth(context, 14),
                      ),
                    ),
                  ),
                ),
              ],
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
                    height: width / 4,
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
                          width: width / 2,
                          child: Transform.scale(
                            scale: switchScale,
                            child: CupertinoSwitch(
                              // width 59, height 39
                              value: dFamily.light,
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
                    height: width / 4,
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
                          width: width / 2,
                          child: Transform.scale(
                            scale: switchScale,
                            child: CupertinoSwitch(
                              value: dFamily.pump,
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
                    height: width / 4,
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
                          width: width / 2,
                          child: Transform.scale(
                            scale: switchScale,
                            child: CupertinoSwitch(
                              value: dFamily.fan,
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

  Widget _buildLargeDevice(Camera camera) {
    final size = MediaQuery.of(context).size;
    final width = (size.width - 16 * 4) / 3;
    final switchScale = (width / 4) / 39; // height of switch 39
    return Container(
      width: width * 3 + 16 * 2,
      height: width,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(camera.image),
                      ),
                      Expanded(
                        flex: 1,
                        child: Transform.scale(
                          scale: switchScale,
                          child: CupertinoSwitch(
                            value: camera.status,
                            activeColor: Colors.green,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      camera.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: scaleWidth(context, 16),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      camera.desc,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: scaleWidth(context, 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 32),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                SizedBox(width: 24),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(camera.camera),
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
}
