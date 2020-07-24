import 'package:flutter/material.dart';

class L extends StatefulWidget {
  final String status;
  L({@required this.status});
  @override
  _LState createState() => _LState();
}

class _LState extends State<L> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.status),
        ),
      ),
    );
  }
}
