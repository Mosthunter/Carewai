import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Addbed extends StatefulWidget {
  final String nummer;
  Addbed({@required this.nummer});
  @override
  _AddbedState createState() => _AddbedState();
}

class _AddbedState extends State<Addbed> {
  int status = 0;
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            width: a.width,
            color: Color(0xffFFFAE5),
            padding: EdgeInsets.only(left: a.width / 20, right: a.width / 20),
            child: Center(
              child: Text(
                "เลือกเตียงผู้ป่วย",
                style: TextStyle(
                  fontSize: a.width / 20,
                  color: Color(0xff579A62),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Color(0xffFFFAF2),
        padding: EdgeInsets.all(a.width / 30),
        child: StreamBuilder(
            stream: Firestore.instance.collection("pbeds").snapshots(),
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
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    DocumentSnapshot beds = snapshot.data.documents[index];

                    return Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(a.width / 30),
                      ),
                      child: beds['status'] == true
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(a.width / 30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          2, 2), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.red),
                              width: a.width,
                              height: a.width,
                              alignment: Alignment.center,
                              child: Text(
                                beds['numberbed'].toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: a.width / 20),
                              ),
                            )
                          : InkWell(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(a.width / 30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(2,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xffFFFAE5)),
                                  width: a.width,
                                  height: a.width,
                                  alignment: Alignment.center,
                                  child: Text(
                                    beds['numberbed'].toString(),
                                    style: TextStyle(
                                        color: Color(0xff579A62),
                                        fontSize: a.width / 20),
                                  )),
                              onTap: () {
                                if (status == 0) {
                                  Firestore.instance
                                      .collection("pbeds")
                                      .document(beds.documentID)
                                      .updateData({'status': true});
                                  setState(() {
                                    status = 1;
                                  });
                                  Firestore.instance
                                      .collection("users")
                                      .document(widget.nummer)
                                      .updateData({
                                    'numberbed': beds.documentID.toString()
                                  });
                                  Navigator.pop(context);
                                } else {
                                  print("null");
                                }
                              }),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
