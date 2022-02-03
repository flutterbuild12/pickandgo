import 'package:pickandgo/models/model.dart';
import 'package:pickandgo/screens/menu/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  _RoutePageState();
  @override
  Widget build(BuildContext context) {
    return contro();
  }
}

class contro extends StatefulWidget {
  contro();

  @override
  _controState createState() => _controState();
}

class _controState extends State<contro> {
  _controState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var emaill;
  var id;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("userz") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.role.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  routing() {
       return Menu(
         rool: loggedInUser.role.toString(),
         email: loggedInUser.email.toString(),
         id: loggedInUser.uid.toString(),
         //     id: id,
       );
  }

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    return routing();
  }
}
