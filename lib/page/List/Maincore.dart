import 'package:cdmmm/page/add/addpatient.dart';
import 'package:cdmmm/widget/Cardmain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Location/Location.dart';
import 'Listpatient.dart';

class Maincore extends StatefulWidget {
  @override
  _MaincoreState createState() => _MaincoreState();
}

class _MaincoreState extends State<Maincore> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff579A62),
      body: Container(
        width: a.width,
        height: a.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Cardmain(
              typecore: "แจ้งเตือน",
              inkwell: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Location(),
                    ));
              },
            ),
            Cardmain(
              typecore: "รายชื่อผู้ป่วย",
              inkwell: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Listpatient(),
                    ));
              },
            ),
            Cardmain(
              typecore: "เพิ่มรายชื่อ",
              inkwell: () {
                Firestore.instance
                    .collection("users")
                    .getDocuments()
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Addpatient(
                          nummm: " ${value.documents.length + 1}",
                          date:
                              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                          time:
                              "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
                        ),
                      ));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
