import 'package:cdmmm/page/List/Listpp.dart';
import 'package:cdmmm/widget/Cardpatient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Listpatient extends StatefulWidget {
  @override
  _ListpatientState createState() => _ListpatientState();
}

class _ListpatientState extends State<Listpatient> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFFFAE5),
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(left: a.width / 20, right: a.width / 20),
            width: a.width,
            height: a.height,
            color: Color(0xffFFFAE5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Icon(Icons.arrow_back_ios,
                      color: Color(0xff579A62), size: a.width / 15),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "รายการผู้ป่วย",
                  style: TextStyle(
                    fontSize: a.width / 20,
                    color: Color(0xff579A62),
                  ),
                ),
                Container()
              ],
            ),
          )
        ],
      ),
      body: Container(
          child: StreamBuilder(
              stream: Firestore.instance.collection("users").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Text(
                    "Loading",
                    style: TextStyle(fontSize: a.width / 20),
                  ));
                } else {
                  return GridView.builder(
                    itemCount: snapshot.data.documents.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      DocumentSnapshot users = snapshot.data.documents[index];
                      return InkWell(
                        child: Cardpatient(
                            number: " ${users['numberbed']}",
                            name: "${users['ชื่อ']}",
                            surname: "${users['นามสกุล']}",
                            op: "${users['อาการเบื้องต้น']}",
                            old: "${users['อายุ']}"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Listpp(
                                  numer: "${users.documentID}",
                                  status: users['numberbed'].toString(),
                                ),
                              ));
                        },
                      );
                    },
                  );
                }
              })),
    );
  }
}
