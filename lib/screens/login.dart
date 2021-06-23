import 'package:assignment11/db/project_db.dart';
import 'package:assignment11/model/project_model.dart';
import 'package:assignment11/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginW extends StatefulWidget {
  @override
  _LoginWState createState() => _LoginWState();
}

class _LoginWState extends State<LoginW> {
  String email = '';
  String password = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.cyan,
          ),
          body: Container(
            margin: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        ListTile(
                          minVerticalPadding: 20,
                          title: TextFormField(
                            onSaved: (value) {
                              setState(() {
                                email = value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          minVerticalPadding: 20,
                          title: TextFormField(
                            onSaved: (value) {
                              setState(() {
                                password = value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                            title: Container(
                          margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                          child: ElevatedButton(
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                            ),
                            onPressed: () async {
                              if (key.currentState.validate()) {
                                key.currentState.save();

                                try {
                                  SignUpModel credential = await ProjectDB
                                      .instance
                                      .readCredentials(email, password);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Home();
                                  }));
                                } catch (e) {
                                  return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: Text('Alert',
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                        content: Text(
                                            'Email or Password is incorrect'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Close'))
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            },
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
