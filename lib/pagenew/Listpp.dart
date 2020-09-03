import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widget/CardAdd.dart';
import '../widget/CardMedicine.dart';

class Listpp extends StatefulWidget {
  final String numer;
  final String status;

  Listpp({@required this.numer, @required this.status});
  @override
  _ListppState createState() => _ListppState();
}

class _ListppState extends State<Listpp> {
  int page = 0;
  String scup;
  var _key = GlobalKey<FormState>();

  _page(int page) {
    switch (page) {
      case 0:
        return page1();
      case 1:
        return page2();
      default:
        return page3();
    }
  }

  TextEditingController seeContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Container(
              width: a.width,
              height: a.height,
              color: Color(0xffFFFAE5),
              child: Stack(
                children: <Widget>[
                  page == 3
                      ? InkWell(
                          child: Container(
                            padding: EdgeInsets.only(right: a.width / 20),
                            width: a.width,
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.add,
                              size: a.width / 15,
                              color: Color(0xff579A62),
                            ),
                          ),
                          onTap: () {
                            Firestore.instance
                                .collection('users')
                                .document(widget.numer)
                                .snapshots()
                                .listen((event) {
                              print(event['numberbed'].toString());
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return CardAdd(
                                      nummer: widget.numer,
                                      status: event['numberbed'].toString(),
                                    );
                                  },
                                  fullscreenDialog: true));
                            });
                          },
                        )
                      : Container(),
                  Center(
                    child: Text(
                      "เตียงผู้ป่วย : " + widget.status,
                      style: TextStyle(
                        fontSize: a.width / 20,
                        color: Color(0xff579A62),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Form(
          key: _key,
          child: Container(
            width: a.width,
            height: a.height,
            child: Stack(
              children: <Widget>[
                Container(
                  child: _page(page),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(a.width / 30),
                      width: a.width,
                      height: a.width / 6,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFAE5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          page == 0
                              ? InkWell(
                                  child: Container(
                                    width: a.width / 4,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ย้อนกลับ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: a.width / 25),
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(a.width)),
                                  ),
                                  onTap: () {
                                    if (page == 0) {
                                      Navigator.pop(context);
                                    }
                                    {
                                      setState(() {
                                        page = 0;
                                      });
                                    }
                                  },
                                )
                              : InkWell(
                                  child: Container(
                                    width: a.width / 4,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ย้อนกลับ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: a.width / 25),
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(a.width)),
                                  ),
                                  onTap: () {
                                    if (page == 1) {
                                      setState(() {
                                        page = 0;
                                      });
                                    } else {
                                      setState(() {
                                        page = 1;
                                      });
                                    }
                                  },
                                ),
                          /* InkWell(
                            child: Container(
                                width: a.width / 4,
                                height: a.width / 8,
                                alignment: Alignment.center,
                                child: Text(
                                  "ลบเตียง",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: a.width / 25),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.circular(a.width))),
                            onTap: () {
                              showDialog(
                                context: context,
                                child: new AlertDialog(
                                  title: const Text("แจ้งเตือน !!!!"),
                                  content: Text(
                                      "คุณกำลังยกเลิกเตียงคนไข้ต้องการดำเนินต่อไหม"),
                                  actions: [
                                    Container(
                                      width: a.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          new FlatButton(
                                            child: const Text("ยกเลิก"),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          new FlatButton(
                                              child: const Text("ตกลง"),
                                              onPressed: () {
                                                Firestore.instance
                                                    .collection("users")
                                                    .document(widget.numer)
                                                    .delete();

                                                Firestore.instance
                                                    .collection('pbeds')
                                                    .document(widget.status)
                                                    .updateData(
                                                        {'status': false});
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ), */
                          /*
                            Firestore.instance
                                    .collection("users")
                                    .document(users['id'])
                                    .collection("medicine")
                                    .document(users.documentID.toString())
                                    .delete();
                           */
                          page == 0
                              ? InkWell(
                                  child: Container(
                                      width: a.width / 4,
                                      height: a.width / 8,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "ไปต่อ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: a.width / 25),
                                      ),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(a.width))),
                                  onTap: () {
                                    if (page == 0) {
                                      setState(() {
                                        page = 1;
                                      });
                                    }
                                  },
                                )
                              : InkWell(
                                  child: Container(
                                      width: a.width / 4,
                                      height: a.width / 8,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "ไปต่อ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: a.width / 25),
                                      ),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(a.width))),
                                  onTap: () {
                                    if (seeContrller.text.toString() == "") {
                                      setState(() {
                                        page = 3;
                                      });
                                    } else {
                                      Firestore.instance
                                          .collection("users")
                                          .document(widget.numer)
                                          .updateData({
                                        'วินิจฉัย':
                                            "${seeContrller.text.toString()}"
                                      });
                                      setState(() {
                                        page = 3;
                                      });
                                    }
                                  },
                                )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  Widget page1() {
    Size a = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffFFFAE5),
      width: a.width,
      height: a.height,
      child: Stack(
        children: <Widget>[
          Container(
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection("users")
                    .document(widget.numer)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Text(
                      "Loading....",
                      style: TextStyle(fontSize: a.width / 20),
                    ));
                  } else {
                    return Container(
                      padding: EdgeInsets.all(a.width / 30),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("เพศ : "),
                                  Container(
                                    width: a.width / 3.5,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(2,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        color: Color(0xff579A62),
                                        borderRadius: BorderRadius.circular(
                                            a.width / 30)),
                                    child: Text(
                                      "${snapshot.data['เพศ']}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 20),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("ชื่อ นามสกุล : "),
                                  Container(
                                    width: a.width / 1.6,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(2,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        color: Color(0xff579A62),
                                        borderRadius: BorderRadius.circular(
                                            a.width / 30)),
                                    child: Text(
                                      "${snapshot.data['ชื่อ']} ${snapshot.data['นามสกุล']}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("วันที่เข้ามา : "),
                                  Container(
                                    width: a.width / 2.8,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(2,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        color: Color(0xff579A62),
                                        borderRadius: BorderRadius.circular(
                                            a.width / 30)),
                                    child: Text(
                                      snapshot.data['วันเดือนปี'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 20),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("วัน/เดือน/ปี เกิด : "),
                                  Container(
                                    width: a.width / 2.8,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(2,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        color: Color(0xff579A62),
                                        borderRadius: BorderRadius.circular(
                                            a.width / 30)),
                                    child: Text(
                                      snapshot.data['วันเดือนปีเกิด'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 20),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("อายุ : "),
                                  Container(
                                    width: a.width / 5,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(2,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        color: Color(0xff579A62),
                                        borderRadius: BorderRadius.circular(
                                            a.width / 30)),
                                    child: Text(
                                      snapshot.data['อายุ'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("อาการเบื้องต้น : "),
                              Container(
                                width: a.width,
                                height: a.width / 1.5,
                                padding: EdgeInsets.all(a.width / 20),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xff579A62),
                                    borderRadius:
                                        BorderRadius.circular(a.width / 30)),
                                child: Text(
                                  snapshot.data['อาการเบื้องต้น'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: a.width / 20),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("หมายเหตุ : "),
                              Container(
                                width: a.width,
                                height: a.width / 3,
                                padding: EdgeInsets.all(a.width / 20),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xff579A62),
                                    borderRadius:
                                        BorderRadius.circular(a.width / 30)),
                                child: Text(
                                  snapshot.data['หมายเหตุ'] == "null"
                                      ? ""
                                      : "${snapshot.data['หมายเหตุ']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: a.width / 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  Widget page2() {
    Size a = MediaQuery.of(context).size;
    return Container(
        color: Color(0xffFFFAE5),
        width: a.width,
        height: a.height,
        child: StreamBuilder(
            stream: Firestore.instance
                .collection("users")
                .document(widget.numer)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data['วินิจฉัย'] == "") {
                return Container(
                  padding: EdgeInsets.all(a.width / 30),
                  width: a.width,
                  height: a.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("วินิจฉัย : "),
                      Container(
                          width: a.width,
                          height: a.height / 1.5,
                          padding: EdgeInsets.all(a.width / 20),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                              color: Color(0xff579A62),
                              borderRadius:
                                  BorderRadius.circular(a.width / 30)),
                          child: SizedBox(
                            child: TextField(
                              controller: seeContrller,
                              maxLines: null,
                              autocorrect: true,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: a.width / 20,
                              ),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          )),
                    ],
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(a.width / 30),
                  width: a.width,
                  height: a.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("วินิจฉัย : "),
                      Container(
                        width: a.width,
                        height: a.height / 1.5,
                        padding: EdgeInsets.all(a.width / 20),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(2, 2), // changes position of shadow
                              ),
                            ],
                            color: Color(0xff579A62),
                            borderRadius: BorderRadius.circular(a.width / 30)),
                        child: Text(
                          snapshot.data['วินิจฉัย'],
                          style: TextStyle(
                              color: Colors.white, fontSize: a.width / 20),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }

  Widget page3() {
    Size a = MediaQuery.of(context).size;
    return Container(
        color: Color(0xffFFFAE5),
        padding: EdgeInsets.only(
            top: a.width / 30,
            left: a.width / 30,
            right: a.width / 30,
            bottom: a.width / 8),
        child: StreamBuilder(
            stream: Firestore.instance
                .collection("users")
                .document(widget.numer)
                .collection("medicine")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Text(
                  "Loading....",
                  style: TextStyle(fontSize: a.width / 20),
                ));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot users = snapshot.data.documents[index];
                    return Column(
                      children: <Widget>[
                        InkWell(
                          child: CardMedicine(
                            n1: "${users['ชื่อยา']}",
                            n2: "${users['จำนวน']}",
                            n3: "${users['วันเดือนปี']}",
                            n4: "${users['เวลา']}",
                            numbed: "${users['เตียงที่']}",
                          ),
                        ),
                        Container(
                          width: a.width,
                          height: a.width / 20,
                        )
                      ],
                    );
                  },
                );
              }
            }));
  }
}
