import 'package:cdmmm/pagenew/mainpage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
        body: InkWell(
      child: Container(
        width: a.width,
        height: a.height,
        child: Image.asset(
          "assets/screen.png",
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ));
      },
    ));
  }
}

// child: StreamBuilder(
//     stream: Firestore.instance.collection("users").snapshots(),
//     builder: (context, snapshot) {
//       if (!snapshot.hasData) {
//         const Text("Loading");
//       } else {
//         return ListView.builder(
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot users =
//                   snapshot.data.documents[index];
//               return Container(
//                   child: CardMedicine(
//                 clocknum: "${users['CN']}",
//                 medicienName: "${users['MN']}",
//                 nummedicien: "${users['ND']}",
//               ));
//             });
//       }
//     })
