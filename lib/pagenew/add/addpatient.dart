import 'package:cdmmm/pagenew/add/addbed.dart';
import 'package:cdmmm/widget/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Addpatient extends StatefulWidget {
  final String nummm;
  final String date;
  final String time;
  Addpatient({@required this.nummm, @required this.date, @required this.time});
  @override
  _AddpatientState createState() => _AddpatientState();
}

class _AddpatientState extends State<Addpatient> {
  String date;
  String timeclock;
  String name;
  String surname;
  String op;
  String sop;
  String dateborn;
  String np = "200";
  String numberone;
  String sex;

  int born;

  int timenow = DateTime.now().year;

  TextEditingController nameContrller = TextEditingController();
  TextEditingController surnameContrller = TextEditingController();
  TextEditingController opContrller = TextEditingController();
  TextEditingController sopContrller = TextEditingController();
  var _key = GlobalKey<FormState>();

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
                  "เพิ่มรายการผู้ป่วย",
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
      body: ListView(
        children: <Widget>[
          Form(
            key: _key,
            child: Container(
              margin: EdgeInsets.all(a.width / 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("หมายเลขผู้ป่วย : "),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: Container(
                                width: a.width / 3.5,
                                height: a.width / 8,
                                alignment: Alignment.center,
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
                                  "${widget.nummm}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: a.width / 20),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("วัน/เดือน/ปี : "),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: Container(
                                width: a.width / 2.8,
                                height: a.width / 8,
                                alignment: Alignment.center,
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
                                  "${widget.date}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: a.width / 20),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("เวลา : "),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: Container(
                                width: a.width / 4.5,
                                height: a.width / 8,
                                alignment: Alignment.center,
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
                                  "${widget.time}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: a.width / 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("เพศ : "),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: Container(
                                width: a.width / 5,
                                height: a.width / 8,
                                alignment: Alignment.center,
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
                                child: InkWell(
                                  child: Container(
                                    width: a.width / 5,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff579A62),
                                        borderRadius: BorderRadius.circular(
                                            a.width / 30)),
                                    child: Text(
                                      sex == null ? "" : sex,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 20),
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          true, // user must tap button!

                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Color(0xffFFFAE6),
                                          actions: <Widget>[
                                            Container(
                                              width: a.width,
                                              height: a.width / 6,
                                              padding:
                                                  EdgeInsets.all(a.width / 50),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  InkWell(
                                                    child: Container(
                                                      width: a.width / 3,
                                                      height: a.width,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      a.width /
                                                                          10),
                                                          color: Color(
                                                              0xff579A62)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "ชาย",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                a.width / 20),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        sex = "ชาย";
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  InkWell(
                                                    child: Container(
                                                      width: a.width / 3,
                                                      height: a.width,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      a.width /
                                                                          10),
                                                          color: Color(
                                                              0xff579A62)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "หญิง",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                a.width / 20),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        sex = "หญิง";
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("วัน/เดือน/ปีเกิด : "),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: InkWell(
                                child: Container(
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
                                      borderRadius:
                                          BorderRadius.circular(a.width / 30)),
                                  child: Text(
                                    dateborn == null ? "" : dateborn,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: a.width / 20),
                                  ),
                                ),
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2500))
                                      .then((data) {
                                    setState(() {
                                      born = data.year.toInt();
                                      dateborn = data.day.toString() +
                                          "/" +
                                          data.month.toString() +
                                          "/" +
                                          data.year.toString();
                                    });
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("อายุ : "),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: Container(
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
                                      borderRadius:
                                          BorderRadius.circular(a.width / 30)),
                                  child: Text(
                                    born == null
                                        ? ""
                                        : "${DateTime.now().year - born}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: a.width / 20,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("ชื่อ : "),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: Container(
                                width: a.width / 2.3,
                                height: a.width / 8,
                                alignment: Alignment.center,
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
                                child: Container(
                                    width: a.width / 2.3,
                                    height: a.width / 8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff579A62),
                                        borderRadius: BorderRadius.circular(
                                            a.width / 30)),
                                    child: TextFormField(
                                      controller: nameContrller,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: a.width / 25,
                                      ),
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      validator: (value) {
                                        return value.trim() == ""
                                            ? Taoast().toast("กรุณาใส่ชื่อ")
                                            : null;
                                      },
                                      onSaved: (value) {
                                        name = value.trim();
                                      },
                                    )),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("นามสกุล : "),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: Container(
                                  width: a.width / 2.3,
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
                                      borderRadius:
                                          BorderRadius.circular(a.width / 30)),
                                  child: TextFormField(
                                    controller: surnameContrller,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: a.width / 25,
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    validator: (value) {
                                      return value.trim() == ""
                                          ? Taoast().toast("กรุณาใส่นามสกุล")
                                          : null;
                                    },
                                    onSaved: (value) {
                                      surname = value.trim();
                                    },
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("อาการเบื้องต้น : "),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(a.width / 30),
                        ),
                        child: Container(
                            padding: EdgeInsets.all(a.width / 20),
                            width: a.width,
                            height: a.width / 1.5,
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
                            child: TextFormField(
                              controller: opContrller,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: a.width / 25,
                              ),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              validator: (value) {
                                return value.trim() == ""
                                    ? Taoast().toast("กรุณาใส่อาการเบื้องต้น")
                                    : null;
                              },
                              onSaved: (value) {
                                op = value.trim();
                              },
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("หมายเหตุ : "),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(a.width / 30),
                        ),
                        child: Container(
                            padding: EdgeInsets.only(
                                left: a.width / 20, right: a.width / 20),
                            width: a.width,
                            height: a.width / 8,
                            alignment: Alignment.center,
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
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: a.width / 25,
                              ),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              controller: sopContrller,
                            )),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(top: a.width / 50),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(a.width / 30),
                              ),
                              child: Container(
                                  width: a.width / 4,
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
                                      color: Color(0xffFFFAE5),
                                      borderRadius:
                                          BorderRadius.circular(a.width / 30)),
                                  child: Text(
                                    "ต่อไป",
                                    style: TextStyle(
                                      color: Color(0xff579A62),
                                      fontSize: a.width / 20,
                                    ),
                                  )),
                            ),
                            onTap: () {
                              if (_key.currentState.validate()) {
                                _key.currentState.save();
                                if (sex == null ||
                                    timenow == null ||
                                    born == null ||
                                    dateborn == null) {
                                  return Taoast()
                                      .toast("กรุณากรอกข้อมูลให้ครบถ่วน");
                                } else {
                                  Firestore.instance
                                      .collectionGroup('medicine')
                                      .getDocuments()
                                      .then((value) {
                                    Firestore.instance
                                        .collectionGroup('users')
                                        .getDocuments()
                                        .then((value) {
                                      print(value.documents.length);
                                      Firestore.instance
                                          .collection("data")
                                          .document("gD0sKLm25r6kw3QhVyRo")
                                          .updateData({
                                        "numbed": "${value.documents.length}"
                                      });
                                    });
                                    Firestore.instance
                                        .collection("users")
                                        .document(widget.nummm)
                                        .setData({
                                      'วันเดือนปี': "${widget.date}",
                                      'เวลา': "${widget.time}",
                                      'เพศ': "${sex}",
                                      'วันเดือนปีเกิด': "${dateborn}",
                                      'อายุ': "${timenow - born}",
                                      'ชื่อ': "${name}",
                                      'นามสกุล': "${surname}",
                                      'อาการเบื้องต้น': "${op}",
                                      'หมายเหตุ':
                                          "${sopContrller.text.toString()}",
                                      'วินิจฉัย': ""
                                    });
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Addbed(
                                            nummer: widget.nummm,
                                          ),
                                        ));
                                  });
                                }
                              }
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
