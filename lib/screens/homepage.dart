import 'package:pickandgo/databasehelper.dart';
import 'package:pickandgo/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/models/sendpackage.dart';
import 'package:pickandgo/screens/user/recievepackage/trackpackage.dart';
import 'package:pickandgo/screens/user/sendpackage/receiverdetails.dart';

import 'loginpage.dart';

class Homepage extends StatefulWidget {
  final String rool;
  final String email;
  final String id;

  Homepage({required this.rool, required this.email, required this.id});

  //const Homepagey({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //List items = [];
  // final controllerName = TextEditingController();
  // final controllerAge = TextEditingController();
  // final controllerDate = TextEditingController();
  //String categoryvalue = "";
  // final sendPackageDetails = SendPackage(receiverName: null, receiverEmail: null, receiverAddress: null, receiverContact: null, receiverPostalCode: null, productDescription: null,
  // productLength: null, productHeight: null, productWidth: null, productWeight: null);

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('Home Screen'),
            actions: [
              IconButton(
                onPressed: () {
                  _db.logout(context);
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                    builder: (_) => LoginPage(),
                  ),
                  );
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: Container(
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: 120,
          ),
          Container(
            height: 60.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
           child:  ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiverDetails()),
                );
              },
              child: const Text('Send Package'),
            ),
            // child: const Padding(
            //   padding: EdgeInsets.only(left: 15.0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       "Send Package",
            //       style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
            //     ),
            //   ),
            // ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            height: 60.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
            child:  ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackPackage()),
                );
              },
              child: const Text('Receive Package'),
            ),
            // child: const Padding(
            //   padding: EdgeInsets.only(left: 15.0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       "Send Package",
            //       style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
            //     ),
            //   ),
            // ),
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      )
      ),
    );
  }

}
