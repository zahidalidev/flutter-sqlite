import 'package:flutter/material.dart';
import 'package:assignment11/screens/login.dart';
import 'package:assignment11/screens/signup.dart';

class MainHome extends StatefulWidget {
  MainHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 250),
            child: ElevatedButton(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.blue),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginW();
                  }));
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: ElevatedButton(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.blue),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignupW();
                  }));
                }),
          )
        ],
      ),
    );
  }
}
