import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:pickandgo/screens/pickupdriver/widgets/navigationdrawerpickupdriver.dart';

// import 'mymap.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(home: PickupRequests()));
// }

class PickupDriverPickupRequests extends StatefulWidget {
  final String role;
  final String email;
  final String id;
  final String name;
  bool? driveroccupied;
  String? operationalcenterid;

  PickupDriverPickupRequests.driver(
      {
        required this.id,
      required this.email,
      required this.role,
        required this.name,
      required this.driveroccupied,
      required this.operationalcenterid});

  PickupDriverPickupRequests(this.id,  this.email, this.role, this.name);

  @override
  _PickupDriverPickupRequestsState createState() => _PickupDriverPickupRequestsState();
}

class _PickupDriverPickupRequestsState extends State<PickupDriverPickupRequests> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  double? cuslat;
  double? cuslong;

  List<Placemark>? lala;

  List<Placemark>? placey;

  getCordFromAdd(double? xy, double? yx) async {

var xyy = xy;
var yxx = yx;
if(xyy!=null && yxx!=null) {
      List<Placemark> placemarks = await placemarkFromCoordinates(xyy, yxx);
      //print("Longitude is: ${placemarks}");
      print("placemarks[0].toString()");
      setState(() {
        lala = placemarks;
      });
    }
  }



  bool _isLoading = true;

  @override
  void initState() {
    //getCordFromAdd();
    super.initState();
    //_stopListening();
    _requestPermission();
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
      drawer: NavigationDrawerWidget(name: widget.name, role: widget.role, id: widget.id,
        email: widget.email, driveroccupied: widget.driveroccupied, operationalcenterid: widget.operationalcenterid,),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('PickandGO - Pickup Delivery'),
      ),
      body:
      Container(
        color: Colors.white,
        child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Icon(Icons.notifications_active,
                color: Colors.black87, size: 28,),
                SizedBox(
                  width: 6.0,
                ),
                Text('Pickup Requests',
                  style: TextStyle(fontSize: 21,
                    fontWeight: FontWeight.bold, color: Colors.black87),),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          (_isLoading==true)
          ?const Padding(
            padding: EdgeInsets.only(top: 350.0),
            child: Center(child: CircularProgressIndicator(),),
          )
          :
          (widget.driveroccupied == false)
              ? Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('package')
                        .where('pickupreqaccepted', isEqualTo: false)
                        .where('operationalcenterid',
                            isEqualTo: widget.operationalcenterid)
                        .snapshots(),

                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            //print(lala);
                           return Card(child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  IconButton(onPressed: (){}, icon: Icon(Icons.local_shipping),),
                                  Flexible(
                                    child: Text(snapshot
                                        .data!.docs[index]['packageid']
                                        .toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),


                                ],
                              ),
                              subtitle: Wrap(
                                children: [

                                      Text("${snapshot
                                          .data!.docs[index]['senderAddress']
                                          .toString()}"),
                                ],
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: MaterialButton(
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  child: Text("Confirm"),
                                  onPressed: () async {
                                    var cusid = snapshot
                                        .data!.docs[index]['packageid']
                                        .toString();
                                    FirebaseFirestore.instance
                                        .collection('package')
                                        .doc(snapshot.data!.docs[index]
                                            ['packageid'])
                                        //update method
                                        .update({
                                      "driverid": widget.id,
                                      //add the user id inside the favourites array
                                      "pickupreqaccepted": true
                                    });

                                    FirebaseFirestore firebaseFirestore =
                                        FirebaseFirestore.instance;

                                    await firebaseFirestore
                                        .collection("users")
                                        .doc(widget.id)
                                        //insert to firebase database
                                        .update({
                                      "packageid": snapshot
                                          .data!.docs[index]['packageid']
                                          .toString(),
                                      "driveroccupied": true,
                                    });
                                    var y = snapshot.data!.docs[index]
                                                ['pickuplatitude'] ==
                                            null
                                        ? 0.0
                                        : snapshot
                                            .data!.docs[index]['pickuplatitude']
                                            .toDouble();
                                    var z = snapshot.data!.docs[index]
                                                ['pickuplongitude'] ==
                                            null
                                        ? 0.0
                                        : snapshot.data!
                                            .docs[index]['pickuplongitude']
                                            .toDouble();

                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MyMap(
                                    //             snapshot.data!.docs[index].id,
                                    //             LatLng(y, z),
                                    //             widget.id,
                                    //             widget.email,
                                    //             widget.role,
                                    //             widget.operationalcenterid,
                                    //             widget.driveroccupied, cusid)
                                    //     ));
                                  },
                                ),
                              ),
                            ),
                            );
                          });
                    },
                  ),
                )
              : (widget.driveroccupied == true)
                  ? Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                            color: Colors.black,
                            textColor: Colors.white,
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(widget.id)
                                  .get()
                                  .then((driver) {
                                FirebaseFirestore.instance
                                    .collection('package')
                                    .doc(driver.data()!['packageid'])
                                    .get()
                                    .then((value) {

                                  var cusidd = value.data()!['userid']
                                      .toString();
                                  var y =
                                      value.data()!['pickuplatitude'] == null
                                          ? 0.0
                                          : value
                                              .data()!['pickuplatitude']
                                              .toDouble();
                                  var z =
                                      value.data()!['pickuplongitude'] == null
                                          ? 0.0
                                          : value
                                              .data()!['pickuplongitude']
                                              .toDouble();

                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => MyMap(
                                  //         value.data()!['packageid'],
                                  //         LatLng(y, z),
                                  //         widget.id,
                                  //         widget.email,
                                  //         widget.role,
                                  //         widget.operationalcenterid,
                                  //         widget.driveroccupied, cusidd))
                                  // );
                                });
                              });
                            },
                            child: Text("Ongoing")),
                      ),
                    )
                  :
          Text("${widget.driveroccupied}"),
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

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('package').doc().set({
        'pickuplatitude': currentlocation.latitude,
        'pickuplongitude': currentlocation.longitude,
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

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
