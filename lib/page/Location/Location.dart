import 'package:auto_refresh_list_view/auto_refresh_list_view.dart';
import 'package:cdmmm/widget/CardMedicine.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../widget/Cardpatient.dart';
import '../List/Listpp.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class _LocationState extends State<Location> {
  String date =
      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
  String message;
  String channelId = "1000";
  String channelName = "FLUTTER_NOTIFICATION_CHANNEL";
  String channelDescription = "FLUTTER_NOTIFICATION_CHANNEL_DETAIL";

  int page = 0;

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
        backgroundColor: Color(0xffFFFAE5),
        appBar: AppBar(
          actions: <Widget>[
            Container(
              width: a.width,
              height: a.width,
              padding: EdgeInsets.only(left: a.width / 20, right: a.width / 20),
              color: Color(0xffFFFAE5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: a.width / 15,
                      color: Color(0xff579A62),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text("แจ้งเตือน",
                      style: TextStyle(
                        fontSize: a.width / 20,
                        color: Color(0xff579A62),
                      )),
                  page == 0
                      ? IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: Color(0xff579A62),
                          ),
                          iconSize: a.width / 15,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        super.widget));
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: Color(0xffFFFAE5),
                          ),
                          iconSize: a.width / 15,
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             super.widget));
                          },
                        )
                ],
              ),
            )
          ],
        ),
        body: PageView(
          controller: PageController(initialPage: 2),
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          children: <Widget>[
            Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collectionGroup('medicine')
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
                      String time2 =
                          "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}";
                      return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot users =
                              snapshot.data.documents[index];

                          if (users['เวลา'] == time2 &&
                              users['วันเดือนปี'] == date) {
                            sendNotification();
                            return InkWell(
                              child: CardMedicine(
                                  n1: "${users['ชื่อยา']}",
                                  n2: "${users['จำนวน']}",
                                  n3: "${users['วันเดือนปี']}",
                                  n4: "${users['เวลา']}"),
                              onTap: () {
                                dialog1(
                                    users['id'], users.documentID.toString());
                              },
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    }
                  }),
            ),
            Container(
              width: a.width,
              height: a.height,
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collectionGroup('medicine')
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
                      String time2 =
                          "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}";
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot users =
                                snapshot.data.documents[index];

                            return InkWell(
                              child: CardMedicine(
                                  n1: "${users['ชื่อยา']}",
                                  n2: "${users['จำนวน']}",
                                  n3: "${users['วันเดือนปี']}",
                                  n4: "${users['เวลา']}"),
                              onTap: () {
                                dialog1(
                                    users['id'], users.documentID.toString());
                              },
                            );
                          });
                    }
                  }),
            )
          ],
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
                          .collection("users")
                          .document(ab)
                          .collection("medicine")
                          .document(bb)
                          .delete();
                      Navigator.pop(context);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
