import 'package:flutter/material.dart';

class CardMedicine extends StatefulWidget {
  final String n1;
  final String n2;
  final String n3;
  final String n4;
  CardMedicine({
    @required this.n1,
    @required this.n2,
    @required this.n3,
    @required this.n4,
  });
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
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
            color: Color(0xffFFFAE5),
            borderRadius: BorderRadius.circular(a.width / 30)),
        padding: EdgeInsets.all(a.width / 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("ชื่อยา : "),
                Container(
                    padding: EdgeInsets.only(
                        left: a.width / 30, right: a.width / 30),
                    width: a.width / 1.6,
                    height: a.width / 8,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Color(0xff579A62),
                        borderRadius: BorderRadius.circular(a.width / 30)),
                    child: Text(
                      widget.n1,
                      style: TextStyle(
                          color: Colors.white, fontSize: a.width / 20),
                    )),
              ],
            ),
            SizedBox(
              height: a.width / 30,
            ),
            Row(
              children: <Widget>[
                Text("จำนวน : "),
                Container(
                    width: a.width / 5,
                    height: a.width / 8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff579A62),
                        borderRadius: BorderRadius.circular(a.width / 30)),
                    child: Text(
                      widget.n2,
                      style: TextStyle(
                          color: Colors.white, fontSize: a.width / 20),
                    )),
                Text(" ต่อครั้ง")
              ],
            ),
            SizedBox(
              height: a.width / 30,
            ),
            Row(
              children: <Widget>[
                Text("วัน/เดือน/ปี : "),
                Container(
                    width: a.width / 2.8,
                    height: a.width / 8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff579A62),
                        borderRadius: BorderRadius.circular(a.width / 30)),
                    child: Text(
                      widget.n3,
                      style: TextStyle(
                          color: Colors.white, fontSize: a.width / 20),
                    )),
              ],
            ),
            SizedBox(
              height: a.width / 30,
            ),
            Row(
              children: <Widget>[
                Text("เวลา : "),
                Container(
                    width: a.width / 5,
                    height: a.width / 8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff579A62),
                        borderRadius: BorderRadius.circular(a.width / 30)),
                    child: Text(
                      widget.n4,
                      style: TextStyle(
                          color: Colors.white, fontSize: a.width / 20),
                    )),
                Text(" น.")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
