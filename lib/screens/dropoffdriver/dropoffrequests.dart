import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:pickandgo/screens/pickupdriver/widgets/navigationdrawerpickupdriver.dart';

// import 'mymap.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(home: PickupRequests()));
// }

class DropoffDriverRequests extends StatefulWidget {
  final String? role;
  final String? email;
  final String? id;
  final String? name;
  bool? driveroccupied;
  String? operationalcenterid;

  DropoffDriverRequests(
      {
          this.id,
        this.email,
        this.role,
        this.name,
       this.driveroccupied,
       this.operationalcenterid});


  @override
  _DropoffDriverRequestsState createState() => _DropoffDriverRequestsState();
}

class _DropoffDriverRequestsState extends State<DropoffDriverRequests> {


  bool _isLoading = true;

  @override
  void initState() {
    //getCordFromAdd();
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
    // location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    // location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    DatabaseHelper _db = DatabaseHelper();
    return Scaffold(
      drawer: NavigationDrawerWidget(name: widget.name!, role: widget.role!, id: widget.id!,
        email: widget.email!, driveroccupied: widget.driveroccupied, operationalcenterid: widget.operationalcenterid,),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('PickandGO - Dropoff Delivery'),
      ),
      body:
      Container(
        color: Colors.white,
        child: Column(
          children: [
            (_isLoading == true)
                ? const Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('uid', isEqualTo: widget.id)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var x = [];
                        x = snapshot.data?.docs[index]['packages'].toList();

                        //print(lala);
                        return (x.length != 0)
                            ? Card (child: ListTile(
                          title: Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                    Icons.card_giftcard_outlined),
                              ),
                              Flexible(
                                child: Text(
                                  snapshot.data!.docs[index]['uid']
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                    Icons.keyboard_arrow_right),
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('package')
                                      .where('deliverydriverid',
                                      isEqualTo: widget.id)
                                      .where('packageDelivered',
                                      isEqualTo: false)
                                      .where(
                                      'packageLeftOperationalCenter',
                                      isEqualTo: false)
                                      .get()
                                      .then((QuerySnapshot
                                  querySnapshot) =>
                                  {
                                    querySnapshot.docs
                                        .forEach((doc) {
                                      FirebaseFirestore
                                          .instance
                                          .collection(
                                          'package')
                                          .doc(doc[
                                      'packageid']
                                          .toString())
                                          .set(
                                          {
                                            "packageLeftOperationalCenter":
                                            true,
                                            //add the ingredient inside the ingredients array

                                          },
                                          SetOptions(
                                              merge:
                                              true));
                                    })
                                  });
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             DropOffDriverMap(
                                  //                 widget.id)));
                                },
                              )
                            ],
                          ),
                        ),)
                            : Text("No Requests");
                      });
                },
              ),
            )
          ],
        ),
    ),
    );
  }

  // _getLocation() async {
  //   try {
  //     final loc.LocationData _locationResult = await location.getLocation();
  //     await FirebaseFirestore.instance.collection('location').doc('user1').set({
  //       'latitude': _locationResult.latitude,
  //       'longitude': _locationResult.longitude,
  //       'name': 'john'
  //     }, SetOptions(merge: true));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
