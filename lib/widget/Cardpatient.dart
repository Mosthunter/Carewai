import 'package:flutter/material.dart';

class Cardpatient extends StatefulWidget {
  final String number;
  final String name;
  final String surname;
  final String old;
  final String op;
  Cardpatient(
      {@required this.number,
      @required this.name,
      @required this.surname,
      @required this.old,
      @required this.op});
  @override
  _CardpatientState createState() => _CardpatientState();
}

class _CardpatientState extends State<Cardpatient> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(a.width / 30),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(a.width / 30),
          color: Color(0xffFFFAE5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(a.width / 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  widget.number,
                  style: TextStyle(
                      color: Color(0xff579B62), fontSize: a.width / 25),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "ชื่อ : ",
                  style: TextStyle(
                      color: Color(0xff579B62), fontSize: a.width / 30),
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                      color: Color(0xff579B62), fontSize: a.width / 30),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "นามสกุล : ",
                  style: TextStyle(
                      color: Color(0xff579B62), fontSize: a.width / 30),
                ),
                Text(
                  widget.surname,
                  style: TextStyle(
                      color: Color(0xff579B62), fontSize: a.width / 30),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "อายุ : ",
                  style: TextStyle(
                      color: Color(0xff579B62), fontSize: a.width / 30),
                ),
                Text(
                  widget.old,
                  style: TextStyle(
                      color: Color(0xff579B62), fontSize: a.width / 30),
                )
              ],
            ),
            Container(
              height: a.width / 5,
              alignment: Alignment.topLeft,
              child: ListView(
                children: <Widget>[
                  Text(
                    "อาการเบื้องต้น : ",
                    style: TextStyle(
                        color: Color(0xff579B62), fontSize: a.width / 30),
                  ),
                  Text(
                    widget.op,
                    style: TextStyle(
                        color: Color(0xff579B62), fontSize: a.width / 30),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
