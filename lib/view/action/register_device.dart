import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demeter/utils/color_utils.dart';
import 'package:demeter/utils/navigator.dart';
import 'package:demeter/utils/path.dart';
import 'package:demeter/utils/widget_utils.dart';

enum ConnectedStatus { connecting, connected, failed }

class RegisterDevice extends StatefulWidget {
  @override
  _RegisterDeviceState createState() => _RegisterDeviceState();
}

class _RegisterDeviceState extends State<RegisterDevice> {
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
          'Register Device',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Container()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(context, 54),
                    vertical: scaleWidth(context, 48),
                  ),
                  child: Text(
                    'Bring device closer to router',
                    style: TextStyle(
                      color: selectedColor,
                      fontSize: scaleWidth(context, 20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _buildConnectingStep(
                    'Device connected', ConnectedStatus.connected),
                _buildConnectingStep(
                    'Message sent to device', ConnectedStatus.connecting),
                _buildConnectingStep(
                    'Connecting device to network', ConnectedStatus.connecting),
              ],
            ),
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.only(
                top: scaleWidth(context, 8),
                bottom: scaleWidth(context, 64),
              ),
              child: FlatButton(
                onPressed: () {
                  push(context, Router.pump);
                },
                child: Text(
                  'Use Now',
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

  Widget _buildConnectingStep(String step, ConnectedStatus status) {
    return RowData(
      leading: status == ConnectedStatus.connected
          ? _buildConnectedIcon()
          : _buildLoadingIcon(),
      title: Text(
        step,
        style: TextStyle(
          color: Colors.black,
          fontSize: scaleWidth(context, 16),
        ),
      ),
      hasUnderLine: false,
    );
  }

  Widget _buildLoadingIcon() {
    return Container(
      width: scaleWidth(context, 16),
      height: scaleWidth(context, 16),
      margin: EdgeInsets.symmetric(horizontal: scaleWidth(context, 16)),
      child: ImageIcon(
        AssetImage(ImagePath.ic_spinner_of_dots),
        color: unselectedColor,
        size: scaleWidth(context, 20),
      ),
    );
  }

  Widget _buildConnectedIcon() {
    return Container(
      width: scaleWidth(context, 16),
      height: scaleWidth(context, 16),
      margin: EdgeInsets.symmetric(horizontal: scaleWidth(context, 16)),
      child: Icon(
        Icons.check_circle,
        color: selectedColor,
        size: scaleWidth(context, 20),
      ),
    );
  }
}
