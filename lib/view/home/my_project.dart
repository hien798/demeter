import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyProject extends StatefulWidget {
  @override
  _MyProjectState createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject>
    with AutomaticKeepAliveClientMixin {
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
          return Container(
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
                    child: Image.asset('assets/images/farm.jpg',
                        fit: BoxFit.cover),
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
                                'Tomato',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '69%',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 5,
                            child: LinearPercentIndicator(
                              percent: 0.69,
                              padding: EdgeInsets.all(5),
                              lineHeight: 10,
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                '15/12/2018',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
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
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Text(
                                    '31/12/2018',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 18,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '8 days left',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
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
        },
        itemCount: 3,
      ),
    );
  }
}
