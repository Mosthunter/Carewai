import 'package:flutter/material.dart';

class CardMedicine extends StatefulWidget {
  final String n1;
  final String n2;
  final String n3;
  final String n4;
  final String numbed;
  CardMedicine(
      {@required this.n1,
      @required this.n2,
      @required this.n3,
      @required this.n4,
      @required this.numbed});
  @override
  _CardMedicineState createState() => _CardMedicineState();
}

class _CardMedicineState extends State<CardMedicine> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(a.width / 30),
      ),
      child: Container(
        padding: EdgeInsets.all(a.width / 30),
        width: a.width,
        height: a.width / 2.5,
        decoration: BoxDecoration(
          color: Color(0xffFDF3CA),
          borderRadius: BorderRadius.circular(a.width / 30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: a.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: a.width / 4,
                    height: a.width / 12,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFAE6),
                        borderRadius: BorderRadius.circular(a.width)),
                    child: Center(
                      child: Text(
                        widget.numbed,
                        style: TextStyle(
                            color: Color(0xff579B62), fontSize: a.width / 25),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text("ชื่อยา :  ",
                      style: TextStyle(
                          color: Color(0xff707070), fontSize: a.width / 28)),
                  Text("${widget.n1}",
                      style: TextStyle(
                          color: Color(0xff579B62), fontSize: a.width / 25))
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text("จำนวน :  ",
                      style: TextStyle(
                          color: Color(0xff707070), fontSize: a.width / 28)),
                  Text("${widget.n2}",
                      style: TextStyle(
                          color: Color(0xff579B62), fontSize: a.width / 25)),
                  Text("  ต่อครั้ง",
                      style: TextStyle(
                          color: Color(0xff707070), fontSize: a.width / 28)),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text("วัน/เดือน/ปี :  ",
                      style: TextStyle(
                          color: Color(0xff707070), fontSize: a.width / 28)),
                  Text("${widget.n3}",
                      style: TextStyle(
                          color: Color(0xff579B62), fontSize: a.width / 25))
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text("เวลา :  ",
                      style: TextStyle(
                          color: Color(0xff707070), fontSize: a.width / 28)),
                  Text("${widget.n4}",
                      style: TextStyle(
                          color: Color(0xff579B62), fontSize: a.width / 25)),
                  Text("  น.",
                      style: TextStyle(
                          color: Color(0xff707070), fontSize: a.width / 28)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
