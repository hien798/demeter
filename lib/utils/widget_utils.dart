import 'package:flutter/material.dart';

scaleWidth(BuildContext context, double width) {
  return width * (MediaQuery
      .of(context)
      .size
      .width / 375);
}

scaleHeight(BuildContext context, double height) {
  return height * (MediaQuery
      .of(context)
      .size
      .height / 812);
}

Widget buildDivider({double height = 0.5, Color color = Colors.grey}) {
  return Container(
    width: double.infinity,
    height: 0.5,
    color: Colors.grey,
  );
}

class RowData extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget title;
  final bool hasUnderLine;
  final double width;
  final double height;

  RowData({Key key,
    this.leading,
    this.trailing,
    this.title,
    this.hasUnderLine = true,
    this.width = double.infinity,
    this.height = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              leading ?? Container(),
              Expanded(child: title ?? Container()),
              trailing ?? Container(),
            ],
          ),
          hasUnderLine ? buildDivider() : Container(),
        ],
      ),
    );
  }
}
