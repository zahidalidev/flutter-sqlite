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
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
            home: Scaffold(
                appBar: AppBar(title: Text('Transaction')),
                drawer: DrawerW(),
                body: TransactionW())));
  }
}

class TransactionW extends StatefulWidget {
  @override
  _TransactionWState createState() => _TransactionWState();
}

class _TransactionWState extends State<TransactionW> {
  int id;
  String accountId = '';
  String description = '';
  String amount = '';
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                'Enter your transaction details.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Form(
                key: key,
                child: Column(
                  children: [
                    ListTile(
                      title: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            id = int.parse(value);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Id',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.description),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            accountId = value.toString();
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Account ID',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.description),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            description = value.toString();
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.description),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            amount = value.toString();
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.attach_money),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                        title: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.cyan,
                            onPrimary: Colors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )),
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
                                    title: Text('Transaction Added',
                                        style: TextStyle(
                                          fontSize: 36,
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
                          }
                        },
                      ),
                    )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
