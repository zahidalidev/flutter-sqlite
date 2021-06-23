import 'package:assignment11/model/project_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment11/screens/login.dart';
import 'package:assignment11/db/project_db.dart';
import 'package:sqflite/sqflite.dart';

class SignupW extends StatefulWidget {
  @override
  _SignupWState createState() => _SignupWState();
}

class _SignupWState extends State<SignupW> {
  String username = '';
  String email = '';
  String number = '';
  String password = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Sign Up",
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
                                username = value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Name',
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
                                number = value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Mobile No',
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
                            margin:
                                EdgeInsets.only(top: 20, left: 80, right: 80),
                            child: ElevatedButton(
                              child: Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                onPrimary: Colors.white,
                                elevation: 5,
                              ),
                              onPressed: () async {
                                if (key.currentState.validate()) {
                                  key.currentState.save();

                                  final credentials = SignUpModel(
                                      name: username,
                                      password: password,
                                      email: email,
                                      number: number);

                                  try {
                                    if (number == '' ||
                                        username == '' ||
                                        email == '' ||
                                        password == '') {
                                      return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoAlertDialog(
                                            title: Text('Alert',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                )),
                                            content: Text(
                                                'Please provide al details'),
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
                                    } else {
                                      SignUpModel credential = await ProjectDB
                                          .instance
                                          .readCredentials(email, password);

                                      if (credential.email == email) {
                                        return showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CupertinoAlertDialog(
                                                title:
                                                    Text('Email already exists',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        )),
                                                content:
                                                    Text('Try another one'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Close'))
                                                ],
                                              );
                                            });
                                      }
                                    }
                                  } catch (e) {
                                    await ProjectDB.instance
                                        .create(credentials);

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoAlertDialog(
                                            title: Text('Successful',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                )),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Close'))
                                            ],
                                          );
                                        });

                                    await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginW();
                                    }));
                                  }
                                }
                              },
                            ),
                          ),
                        ),
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
