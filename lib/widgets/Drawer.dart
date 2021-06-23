import 'package:assignment11/main.dart';
import 'package:assignment11/screens/transaction.dart';
import 'package:flutter/material.dart';

class DrawerW extends StatefulWidget {
  @override
  _DrawerWState createState() => _DrawerWState();
}

class _DrawerWState extends State<DrawerW> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 180.0,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text('Zahid Ali',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600))),
                  Container(
                      child: Text('m.zahidalidev@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600))),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet_outlined),
            title: Text('Transaction Operations',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                )),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Transactions();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyApp();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
