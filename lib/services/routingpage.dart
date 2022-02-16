import 'package:pickandgo/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/dropoffdriver/dropoffdriverdroppackageonreceiver.dart';
import 'package:pickandgo/screens/pickupdriver/pickuprequests.dart';
import 'package:pickandgo/screens/operationalcenter/opc_dashboard.dart';
import 'package:pickandgo/screens/operationalcenter/opc_assigndropoffdriver.dart';


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
  var role;
  var emaill;
  var id;
  var driveroccupied;
  var operationalcenterid;
  @override
  void initState() {

    if (user?.uid != null) {
      super.initState();
      FirebaseFirestore.instance
          .collection("users") //.where('uid', isEqualTo: user!.uid)
          .doc(user?.uid)
          .get()
          .then((value) {
        this.loggedInUser = UserModel.fromMap(value.data());
      }).whenComplete(() {
        CircularProgressIndicator();
        if(this.mounted) {
          setState(() {
            emaill = loggedInUser.email.toString();
            role = loggedInUser.role.toString();
            id = loggedInUser.uid.toString();
            driveroccupied = loggedInUser.driveroccupied;
            operationalcenterid = loggedInUser.operationalcenterid.toString();
          });
        }
      });
    }
  }

  routing() {

    return
      (role == "Driver")
          ?PickupDriverPickupRequests.driver(
        role: loggedInUser.role.toString(),
        email: loggedInUser.email.toString(),
        id: loggedInUser.uid.toString(),
        name: loggedInUser.name.toString(),
        driveroccupied: loggedInUser.driveroccupied,
        operationalcenterid: loggedInUser.operationalcenterid.toString(),
        //     id: id,
      ):
      (role == "OperationalCenter")
          ?Dashboard(
        loggedInUser.uid.toString(),
        loggedInUser.operationalcenterid.toString(),
        loggedInUser.email.toString(),
        loggedInUser.name.toString(),
        loggedInUser.mobile.toString(),
        loggedInUser.status.toString(),
        loggedInUser.address.toString(),
        loggedInUser.uid.toString(),
        //     id: id,
      ):
      (role == "DropoffDriver")
          ?DropPackagesDropOffDriver(
        loggedInUser.uid.toString(),
        loggedInUser.operationalcenterid.toString(),

      ):
      PickupDriverPickupRequests(
        loggedInUser.uid.toString(),
        loggedInUser.email.toString(),
        loggedInUser.role.toString(),
        loggedInUser.name.toString(),
        //id: id,
      );

  }

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    return routing();
  }
}