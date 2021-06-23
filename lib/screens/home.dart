import 'package:assignment11/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:assignment11/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
            home: DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            title: Text('Home Screen'),
            backgroundColor: Colors.cyan,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Expenses',
                ),
                Tab(
                  text: 'Revenue',
                ),
                Tab(
                  text: 'Combined',
                )
              ],
            ),
          ),
          body: HomePage(),
          drawer: DrawerW()),
    )));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 250,
      height: 100,
      child: TabBarView(children: [
        ElevatedButton(
          child: Text(
            'Elevated Button',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent[700],
            onPrimary: Colors.white,
            elevation: 50,
            shadowColor: Colors.blueAccent,
          ),
          onPressed: () {},
        ),
        ElevatedButton(
          child: Text(
            'Elevated Button',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent[700],
            onPrimary: Colors.white,
            elevation: 50,
            shadowColor: Colors.blueAccent,
          ),
          onPressed: () {},
        ),
        ElevatedButton(
          child: Text(
            'Elevated Button',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent[700],
            onPrimary: Colors.white,
            elevation: 50,
            shadowColor: Colors.blueAccent,
          ),
          onPressed: () {},
        ),
      ]),
    ));
  }
}
