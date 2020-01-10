import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Center(
                    child: Text('Logo'),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Forget your password? '),
                    InkWell(
                      child: Text(
                        'RESET PASSWORD',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('LOGIN'),
                    color: Colors.black54,
                    shape: StadiumBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('REGISTER'),
                    color: Colors.transparent,
                    shape: StadiumBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.white,
                      ),
                    ),
                    Text(' Other way to login '),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.transparent,
                        child: Text('f'),
                        shape: CircleBorder(),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.transparent,
                        child: Text('G'),
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
