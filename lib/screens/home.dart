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
            drawer: DrawerW(),
            body: Center(
              child: Container(
                width: 400,
                child: TabBarView(children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20, right: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DataTable(
                            columnSpacing: 20,
                            dataRowHeight: 60,
                            columns: const <DataColumn>[
                              DataColumn(label: Text('id')),
                              DataColumn(label: Text('AccountId')),
                              DataColumn(label: Text('Description')),
                              DataColumn(label: Text('drAmount')),
                              DataColumn(label: Text('CrAmount')),
                            ],
                            rows: const <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('1')),
                                  DataCell(Text('1')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$30')),
                                  DataCell(Text('\$70')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('2')),
                                  DataCell(Text('2')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$24')),
                                  DataCell(Text('\$40')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('3')),
                                  DataCell(Text('3')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$20')),
                                  DataCell(Text('\$50')),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20, right: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DataTable(
                            columnSpacing: 20,
                            dataRowHeight: 60,
                            columns: const <DataColumn>[
                              DataColumn(label: Text('id')),
                              DataColumn(label: Text('AccountId')),
                              DataColumn(label: Text('Description')),
                              DataColumn(label: Text('drAmount')),
                              DataColumn(label: Text('CrAmount')),
                            ],
                            rows: const <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('1')),
                                  DataCell(Text('1')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$30')),
                                  DataCell(Text('\$70')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('2')),
                                  DataCell(Text('2')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$24')),
                                  DataCell(Text('\$40')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('3')),
                                  DataCell(Text('3')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$20')),
                                  DataCell(Text('\$50')),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20, right: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DataTable(
                            columnSpacing: 20,
                            dataRowHeight: 60,
                            columns: const <DataColumn>[
                              DataColumn(label: Text('id')),
                              DataColumn(label: Text('AccountId')),
                              DataColumn(label: Text('Description')),
                              DataColumn(label: Text('drAmount')),
                              DataColumn(label: Text('CrAmount')),
                            ],
                            rows: const <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('1')),
                                  DataCell(Text('1')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$30')),
                                  DataCell(Text('\$70')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('2')),
                                  DataCell(Text('2')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$24')),
                                  DataCell(Text('\$40')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('3')),
                                  DataCell(Text('3')),
                                  DataCell(Text('description')),
                                  DataCell(Text('\$20')),
                                  DataCell(Text('\$50')),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
