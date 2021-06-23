import 'package:flutter/material.dart';

class AppshowDatePicker extends StatefulWidget {
  final String label;
  AppshowDatePicker({this.label});

  @override
  _AppshowDatePicker createState() => _AppshowDatePicker();
}

class _AppshowDatePicker extends State<AppshowDatePicker> {
  DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
      child: Column(
        children: [
          Column(
            children: [
              ElevatedButton(
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    widget.label,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                ),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1500),
                          lastDate: DateTime(4000))
                      .then((date) {
                    setState(() {
                      dateTime = date;
                    });
                  });
                },
              ),
              Text(
                dateTime == null
                    ? 'Nothing has been picked'
                    : dateTime.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
