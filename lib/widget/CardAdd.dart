import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widget/toast.dart';

class CardAdd extends StatefulWidget {
  final String nummer;
  final String status;

  CardAdd({@required this.nummer, @required this.status});
  @override
  _CardAddState createState() => _CardAddState();
}

class _CardAddState extends State<CardAdd> {
  String stime;
  String sdate;
  String nbed;
  String medicine;
  String num1;
  var _key = GlobalKey<FormState>();

  TextEditingController drugContrller = TextEditingController();
  TextEditingController numContrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Container(
      width: a.width,
      height: a.height,
      color: Color(0xffFFFAE5),
      padding: EdgeInsets.all(a.width / 20),
      child: Form(
        key: _key,
        child: Center(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(a.width / 30),
              width: a.width,
              height: a.width / 1.1,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "ชื่อยา :  ",
                        style: TextStyle(fontSize: a.width / 30),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: a.width / 30),
                        margin: EdgeInsets.only(left: a.width / 40),
                        width: a.width / 1.6,
                        height: a.width / 8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Color(0xff579A62),
                            borderRadius: BorderRadius.circular(a.width / 30)),
                        child: TextFormField(
                          controller: drugContrller,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: a.width / 20,
                          ),
                          decoration: InputDecoration(border: InputBorder.none),
                          validator: (val) {
                            return val.trim() == ""
                                ? Taoast().toast("กรุณาใส่ชื่อยา")
                                : null;
                          },
                          onSaved: (value) {
                            medicine = value.trim();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: a.width / 30,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "จำนวน : ",
                        style: TextStyle(fontSize: a.width / 30),
                      ),
                      Container(
                        width: a.width / 5,
                        height: a.width / 8,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: a.width / 40, right: a.width / 40),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Color(0xff579A62),
                            borderRadius: BorderRadius.circular(a.width / 30)),
                        child: TextFormField(
                          controller: numContrller,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: a.width / 20,
                          ),
                          decoration: InputDecoration(border: InputBorder.none),
                          validator: (val) {
                            return val.trim() == ""
                                ? Taoast().toast("กรุณาจำนวนยา")
                                : null;
                          },
                          onSaved: (value) {
                            num1 = value.trim();
                          },
                        ),
                      ),
                      Text(
                        " ต่อครั้ง",
                        style: TextStyle(fontSize: a.width / 30),
                      )
                    ],
                  ),
                  SizedBox(
                    height: a.width / 30,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "วัน/เดือน/ปี : ",
                        style: TextStyle(fontSize: a.width / 30),
                      ),
                      InkWell(
                        child: Container(
                          width: a.width / 2.8,
                          height: a.width / 8,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: a.width / 40),
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
                              color: Color(0xff579A62),
                              borderRadius:
                                  BorderRadius.circular(a.width / 30)),
                          child: Text(
                            sdate == null ? "" : sdate,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: a.width / 20,
                            ),
                          ),
                        ),
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000))
                              .then((date) {
                            setState(() {
                              sdate = "${date.day}/${date.month}/${date.year}";
                            });
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: a.width / 30,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "เวลา : ",
                        style: TextStyle(fontSize: a.width / 30),
                      ),
                      InkWell(
                        child: Container(
                          width: a.width / 5,
                          height: a.width / 8,
                          margin: EdgeInsets.only(
                              left: a.width / 40, right: a.width / 40),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff579A62),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.circular(a.width / 30)),
                          child: Text(
                            stime == null ? "" : stime,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: a.width / 20,
                            ),
                          ),
                        ),
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((timeshow) {
                            setState(() {
                              stime = "${timeshow.hour}:${timeshow.minute}";
                            });
                          });
                        },
                      ),
                      Text(
                        " น.",
                        style: TextStyle(fontSize: a.width / 30),
                      )
                    ],
                  ),
                  SizedBox(height: a.width / 20),
                  Container(
                    width: a.width,
                    child: InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(a.width / 30),
                        ),
                        child: Container(
                            width: a.width / 4,
                            height: a.width / 8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
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
                        Firestore.instance
                            .collectionGroup('medicine')
                            .getDocuments()
                            .then((value) {
                          if (_key.currentState.validate()) {
                            _key.currentState.save();
                            if (sdate == null || stime == null) {
                              Taoast().toast("กรุณาใส่ข้อมูลให้ครบถ่วน");
                            } else {
                              Firestore.instance
                                  .collection("data")
                                  .document("gD0sKLm25r6kw3QhVyRo")
                                  .updateData({
                                'nummedicine': "${value.documents.length + 1}"
                              });
                              Firestore.instance
                                  .collection("users")
                                  .document(widget.nummer)
                                  .collection("medicine")
                                  .document()
                                  .setData({
                                'เตียงที่': widget.status,
                                'id': widget.nummer,
                                'ชื่อยา': "${medicine}",
                                'จำนวน': "${num1}",
                                'วันเดือนปี': "${sdate}",
                                'เวลา': "${stime}"
                              });
                              Navigator.pop(context);
                            }
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
