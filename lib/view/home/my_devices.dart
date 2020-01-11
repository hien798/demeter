import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDevice extends StatefulWidget {
  @override
  _MyDeviceState createState() => _MyDeviceState();
}

class _MyDeviceState extends State<MyDevice> {
  @override
  Widget build(BuildContext context) {
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
          height: 64,
          margin: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              'Add Device',
              style: TextStyle(fontSize: 18),
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
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
      children: <Widget>[
        Row(
          children: List.generate(3, (index) => _buildSmallDevice()),
        ),
        Row(
          children: <Widget>[
            _buildMediumDevice(),
            _buildSmallDevice(),
          ],
        ),
        Row(
          children: <Widget>[
            _buildLargeDevice(),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallDevice() {
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
                  child: Image.asset('assets/images/light.jpg'),
                ),
                Expanded(
                  flex: 1,
                  child: Transform.scale(
                    scale: switchScale,
                    child: CupertinoSwitch(
                      value: true,
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
                'Light',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'On',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediumDevice() {
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
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset('assets/images/light.jpg'),
                      ),
                      Expanded(
                        flex: 1,
                        child: Transform.scale(
                          scale: switchScale,
                          child: CupertinoSwitch(
                            value: true,
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
                      'DFamily',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'On',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: width / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Light',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Transform.scale(
                        scale: switchScale,
                        child: CupertinoSwitch(
                          // width 59, height 39
                          value: true,
                          activeColor: Colors.green,
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: width / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Pump',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Transform.scale(
                        scale: switchScale,
                        child: CupertinoSwitch(
                          value: false,
                          activeColor: Colors.green,
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: width / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Fan',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Transform.scale(
                        scale: switchScale,
                        child: CupertinoSwitch(
                          value: true,
                          activeColor: Colors.green,
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeDevice() {
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
                        child: Image.asset('assets/images/light.jpg'),
                      ),
                      Expanded(
                        flex: 1,
                        child: Transform.scale(
                          scale: switchScale,
                          child: CupertinoSwitch(
                            value: true,
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
                      'Camera',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'On',
                      style: TextStyle(
                        color: Colors.grey,
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
                        image: AssetImage('assets/images/farm.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/images/ic_play.png'),
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
