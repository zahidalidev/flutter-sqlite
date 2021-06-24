import 'package:assignment11/db/project_db.dart';
import 'package:assignment11/model/project_model.dart';
import 'package:assignment11/widgets/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int id;
  String accountId = '';
  String description = '';
  String amount = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Transaction",
              style: TextStyle(color: Colors.white),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.cyan,
          ),
          drawer: DrawerW(),
          body: Container(
            margin: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Enter transaction details.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        ListTile(
                          minVerticalPadding: 15,
                          title: TextFormField(
                            onSaved: (value) {
                              setState(() {
                                id = int.parse(value);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Id',
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
                          minVerticalPadding: 15,
                          title: TextFormField(
                            onSaved: (value) {
                              setState(() {
                                accountId = value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Account ID',
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
                          minVerticalPadding: 15,
                          title: TextFormField(
                            onSaved: (value) {
                              setState(() {
                                description = value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Description',
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
                          minVerticalPadding: 15,
                          title: TextFormField(
                            onSaved: (value) {
                              setState(() {
                                amount = value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Amount',
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
                                EdgeInsets.only(top: 20, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      'Save',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.cyan,
                                  ),
                                  onPressed: () async {
                                    if (key.currentState.validate()) {
                                      key.currentState.save();

                                      final transactions = TransactionsModel(
                                          id: id,
                                          accountId: accountId,
                                          description: description,
                                          crAmount: amount,
                                          drAmount: amount,
                                          date: DateTime.now());

                                      await ProjectDB.instance
                                          .createTransaction(transactions);

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CupertinoAlertDialog(
                                              title: Text(
                                                'Transaction Added',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
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
                                  },
                                ),
                                ElevatedButton(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                  ),
                                  onPressed: () async {
                                    if (key.currentState.validate()) {
                                      key.currentState.save();

                                      final transactions = TransactionsModel(
                                          id: id,
                                          accountId: accountId,
                                          description: description,
                                          crAmount: amount,
                                          drAmount: amount,
                                          date: DateTime.now());

                                      await ProjectDB.instance
                                          .createTransaction(transactions);

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CupertinoAlertDialog(
                                              title: Text(
                                                'Transaction Added',
                                                style: TextStyle(
                                                  fontSize: 36,
                                                ),
                                              ),
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
                                  },
                                ),
                                ElevatedButton(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      'Update',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent,
                                  ),
                                  onPressed: () async {
                                    if (key.currentState.validate()) {
                                      key.currentState.save();

                                      final transactions = TransactionsModel(
                                          id: id,
                                          accountId: accountId,
                                          description: description,
                                          crAmount: amount,
                                          drAmount: amount,
                                          date: DateTime.now());

                                      await ProjectDB.instance
                                          .createTransaction(transactions);

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoAlertDialog(
                                            title: Text(
                                              'Transaction Added',
                                              style: TextStyle(
                                                fontSize: 36,
                                              ),
                                            ),
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
                                  },
                                ),
                              ],
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
