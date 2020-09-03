import 'package:cdmmm/pagenew/add/addpatient.dart';
import 'package:cdmmm/pagenew/Listpp.dart';
import 'package:cdmmm/widget/CardMedicine.dart';
import 'package:cdmmm/widget/Cardpatient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class _MainPageState extends State<MainPage> {
  String date =
      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
  int page = 0;
  int page1 = 0;

  String message;
  String channelId = "1000";
  String channelName = "FLUTTER_NOTIFICATION_CHANNEL";
  String channelDescription = "FLUTTER_NOTIFICATION_CHANNEL_DETAIL";

  var controller = PageController(initialPage: 0);

  @override
  initState() {
    message = "No message.";

    var initializationSettingsAndroid =
        AndroidInitializationSettings('launch_background');

    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {
      print("onDidReceiveLocalNotification called.");
    });
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
      // when user tap on notification.
      print("onSelectNotification called.");
      setState(() {
        message = payload;
      });
    });
    super.initState();
  }

  sendNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails('10000',
        'FLUTTER_NOTIFICATION_CHANNEL', 'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        111, 'แจ้งเตือน,ให้ยา', 'ถึงเวลาให้ยาแล้ว', platformChannelSpecifics,
        payload: 'I just haven\'t Met You Yet');
  }

  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffFFFAE6),
        body: Container(
          width: a.width,
          height: a.height,
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection("data")
                  .document("gD0sKLm25r6kw3QhVyRo")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Text(
                    "Loading",
                    style: TextStyle(fontSize: a.width / 20),
                  ));
                } else {
                  return Container(
                    width: a.width,
                    height: a.height,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            child: Container(
                          width: a.width,
                          height: a.height,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: a.width,
                                height: a.width / 3.5,
                              ),
                              Container(
                                width: a.width,
                                height: a.height / 1.3,
                                child: PageView(
                                  onPageChanged: (value) {
                                    setState(() {
                                      page = value;
                                    });
                                  },
                                  scrollDirection: Axis.horizontal,
                                  controller: controller,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: a.width / 30,
                                          right: a.width / 30),
                                      width: a.width,
                                      height: a.height,
                                      child: StreamBuilder(
                                          stream: Firestore.instance
                                              .collection("users")
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData &&
                                                snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                              return Center(
                                                  child: Text(
                                                "Loading",
                                                style: TextStyle(
                                                    fontSize: a.width / 20),
                                              ));
                                            } else {
                                              return GridView.builder(
                                                itemCount: snapshot
                                                    .data.documents.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2),
                                                itemBuilder: (context, index) {
                                                  DocumentSnapshot users =
                                                      snapshot.data
                                                          .documents[index];

                                                  return InkWell(
                                                    child: Cardpatient(
                                                        number:
                                                            " ${users['numberbed']}",
                                                        name:
                                                            "${users['ชื่อ']}",
                                                        surname:
                                                            "${users['นามสกุล']}",
                                                        op:
                                                            "${users['อาการเบื้องต้น']}",
                                                        old:
                                                            "${users['อายุ']}"),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Listpp(
                                                              numer:
                                                                  "${users.documentID}",
                                                              status: users[
                                                                      'numberbed']
                                                                  .toString(),
                                                            ),
                                                          ));
                                                    },
                                                  );
                                                },
                                              );
                                            }
                                          }),
                                    ),
                                    page1 == 0
                                        ? Container(
                                            width: a.width,
                                            height: a.height,
                                            margin: EdgeInsets.only(
                                                left: a.width / 30,
                                                right: a.width / 6),
                                            child: StreamBuilder(
                                                stream: Firestore.instance
                                                    .collectionGroup('medicine')
                                                    .snapshots(),
                                                builder: (context, snapshot) {
                                                  if (!snapshot.hasData &&
                                                      snapshot.connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                    return Center(
                                                        child: Text(
                                                      "Loading....",
                                                      style: TextStyle(
                                                          fontSize:
                                                              a.width / 20),
                                                    ));
                                                  } else {
                                                    String time2 =
                                                        "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}";
                                                    return ListView.builder(
                                                      itemCount: snapshot.data
                                                          .documents.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        DocumentSnapshot users =
                                                            snapshot.data
                                                                    .documents[
                                                                index];

                                                        if (users['เวลา'] ==
                                                                time2 &&
                                                            users['วันเดือนปี'] ==
                                                                date) {
                                                          sendNotification();
                                                          sendNotification();
                                                          return Column(
                                                            children: <Widget>[
                                                              InkWell(
                                                                child:
                                                                    CardMedicine(
                                                                  n1: "${users['ชื่อยา']}",
                                                                  n2: "${users['จำนวน']}",
                                                                  n3: "${users['วันเดือนปี']}",
                                                                  n4: "${users['เวลา']}",
                                                                  numbed:
                                                                      "${users['เตียงที่']}",
                                                                ),
                                                                onTap: () {
                                                                  print("a");
                                                                  dialog1(
                                                                      users[
                                                                          'id'],
                                                                      users
                                                                          .documentID
                                                                          .toString());
                                                                },
                                                              ),
                                                              Container(
                                                                width: a.width,
                                                                height:
                                                                    a.width /
                                                                        20,
                                                              )
                                                            ],
                                                          );
                                                        } else {
                                                          return Container();
                                                        }
                                                      },
                                                    );
                                                  }
                                                }),
                                          )
                                        : Container(
                                            width: a.width,
                                            height: a.height,
                                            margin: EdgeInsets.only(
                                                left: a.width / 30,
                                                right: a.width / 6),
                                            child: StreamBuilder(
                                                stream: Firestore.instance
                                                    .collectionGroup('medicine')
                                                    .snapshots(),
                                                builder: (context, snapshot) {
                                                  if (!snapshot.hasData &&
                                                      snapshot.connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                    return Center(
                                                        child: Text(
                                                      "Loading....",
                                                      style: TextStyle(
                                                          fontSize:
                                                              a.width / 20),
                                                    ));
                                                  } else {
                                                    return ListView.builder(
                                                        itemCount: snapshot.data
                                                            .documents.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          DocumentSnapshot
                                                              users = snapshot
                                                                      .data
                                                                      .documents[
                                                                  index];

                                                          return Column(
                                                            children: <Widget>[
                                                              InkWell(
                                                                child:
                                                                    CardMedicine(
                                                                  n1: "${users['ชื่อยา']}",
                                                                  n2: "${users['จำนวน']}",
                                                                  n3: "${users['วันเดือนปี']}",
                                                                  n4: "${users['เวลา']}",
                                                                  numbed:
                                                                      "${users['เตียงที่']}",
                                                                ),
                                                                onTap: () {
                                                                  print("a");
                                                                  dialog1(
                                                                      users[
                                                                          'id'],
                                                                      users
                                                                          .documentID
                                                                          .toString());
                                                                },
                                                              ),
                                                              Container(
                                                                width: a.width,
                                                                height:
                                                                    a.width /
                                                                        20,
                                                              )
                                                            ],
                                                          );
                                                        });
                                                  }
                                                }),
                                          )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                        page == 0
                            ? Container()
                            : Positioned(
                                bottom: a.width / 4,
                                child: Container(
                                  padding: EdgeInsets.only(right: a.width / 30),
                                  width: a.width,
                                  height: a.width / 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        height: a.width / 2.5,
                                        width: a.width / 10,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(1,
                                                    2), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(
                                                a.width / 5),
                                            color: Color(0xff579B62)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            InkWell(
                                              child: Icon(Icons.assignment_late,
                                                  color: page1 == 0
                                                      ? Colors.white
                                                      : Color(0xffA59D83),
                                                  size: a.width / 15),
                                              onTap: () {
                                                setState(() {
                                                  page1 = 0;
                                                });
                                              },
                                            ),
                                            InkWell(
                                              child: Icon(Icons.assignment,
                                                  color: page1 == 1
                                                      ? Colors.white
                                                      : Color(0xffA59D83),
                                                  size: a.width / 15),
                                              onTap: () {
                                                setState(() {
                                                  page1 = 1;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                        Positioned(
                            top: 0,
                            child: Container(
                              width: a.width,
                              height: a.width / 4,
                              padding: EdgeInsets.only(
                                  left: a.width / 30, right: a.width / 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    page == 0
                                        ? "เตียงผู้ป่วยอยู่ : ${snapshot.data['numbed']} เตียง"
                                        : "แจ้งเตือนยา : ${snapshot.data['nummedicine']} อัน",
                                    style: TextStyle(
                                        color: Color(0xff579B62),
                                        fontSize: a.width / 22),
                                  ),
                                  Container(
                                    width: a.width / 2.5,
                                    height: a.width / 10,
                                    padding: EdgeInsets.only(
                                        left: a.width / 40,
                                        right: a.width / 40),
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
                                      borderRadius:
                                          BorderRadius.circular(a.width / 5),
                                      color: Color(0xffFDF3CA),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              if (controller.page != 0)
                                                controller.previousPage(
                                                    duration: Duration(
                                                        milliseconds: 120),
                                                    curve: Curves.ease);
                                            },
                                            child: Text(
                                              "เตียงผู้ป่วย",
                                              style: TextStyle(
                                                  color: page == 0
                                                      ? Color(0xff579B62)
                                                      : Color(0xff707070),
                                                  fontSize: a.width / 30),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: a.width / 50,
                                                bottom: a.width / 50),
                                            width: a.width / 100,
                                            color: Color(0xff707070),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (controller.page != 1)
                                                controller.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 120),
                                                    curve: Curves.ease);
                                            },
                                            child: Text(
                                              "เตือนยา",
                                              style: TextStyle(
                                                  color: page == 0
                                                      ? Color(0xff707070)
                                                      : Color(0xff579B62),
                                                  fontSize: a.width / 30),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: a.width,
                              height: a.width / 3,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: a.width,
                                      height: a.width / 5,
                                      padding: EdgeInsets.only(
                                          left: a.width / 30,
                                          right: a.width / 30),
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
                                        color: Color(0xffFDF3CA),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: a.width / 3.2,
                                            height: a.width / 10,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFFFAE6),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        a.width)),
                                            child: Center(
                                                child: Text(
                                                    "ผู้ป่วย : ${snapshot.data['numbed']} คน",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffA59D83),
                                                        fontSize:
                                                            a.width / 30))),
                                          ),
                                          Container(
                                            width: a.width / 3.2,
                                            height: a.width / 10,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFFFAE6),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        a.width)),
                                            child: Center(
                                                child: Text(
                                                    "เตียง : ${snapshot.data['numbed']} / 750",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffA59D83),
                                                        fontSize:
                                                            a.width / 30))),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                        child: Container(
                                          width: a.width / 4,
                                          height: a.width / 4,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: a.width / 6,
                                          ),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      2), // changes position of shadow
                                                ),
                                              ],
                                              color: Color(0xff579B62),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      a.width)),
                                        ),
                                        onTap: () {
                                          Firestore.instance
                                              .collection("users")
                                              .getDocuments()
                                              .then((value) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Addpatient(
                                                    nummm:
                                                        " ${value.documents.length + 1}",
                                                    date:
                                                        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                                    time:
                                                        "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
                                                  ),
                                                ));
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                }
              }),
        ));
  }

  Widget dialog1(String ab, String bb) {
    Size a = MediaQuery.of(context).size;

    showDialog(
      context: context,
      child: new AlertDialog(
        title: const Text("แจ้งเตือน !!!!"),
        content: Text("ยืนยันการให้ยาคนไข้"),
        actions: [
          Container(
            width: a.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new FlatButton(
                  child: const Text("ยกเลิก"),
                  onPressed: () => Navigator.pop(context),
                ),
                new FlatButton(
                    child: const Text("ตกลง"),
                    onPressed: () {
                      Firestore.instance
                          .collectionGroup('medicine')
                          .getDocuments()
                          .then((value) {
                        Firestore.instance
                            .collection("data")
                            .document("gD0sKLm25r6kw3QhVyRo")
                            .updateData({
                          'nummedicine': "${value.documents.length - 1}"
                        });
                        Firestore.instance
                            .collection("users")
                            .document(ab)
                            .collection("medicine")
                            .document(bb)
                            .delete();
                        Navigator.pop(context);
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
