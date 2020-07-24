import 'package:flutter/material.dart';

class Cardmain extends StatefulWidget {
  final String typecore;
  final Function inkwell;
  Cardmain({@required this.typecore, @required this.inkwell});
  @override
  _CardmainState createState() => _CardmainState();
}

class _CardmainState extends State<Cardmain> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return InkWell(
      child: Card(
        elevation: 10,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(
          a.width / 20,
        )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(a.width / 20),
            color: Color(0xffFFFAE5),
          ),
          width: a.width / 1.1,
          height: a.height / 5,
          child: Center(
            child: Text(
              widget.typecore,
              style: TextStyle(fontSize: a.width / 10),
            ),
          ),
        ),
      ),
      onTap: widget.inkwell,
    );
  }
}
