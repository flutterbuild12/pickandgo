import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/pickupdriver/widgets/navigationdrawerpickupdriver.dart';


class PickupDriverProfile extends StatefulWidget {
  final String role;
  final String email;
  final String id;
  final String name;
  bool? driveroccupied;
  String? operationalcenterid;

  PickupDriverProfile(
      {
        required this.id,
        required this.email,
        required this.role,
        required this.name,
        required this.driveroccupied,
        required this.operationalcenterid});
  @override
  _PickupDriverProfileState createState() => _PickupDriverProfileState();
}

class _PickupDriverProfileState extends State<PickupDriverProfile> {

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          drawer:  NavigationDrawerWidget(name: widget.name, role: widget.role, id: widget.id,
            email: widget.email, driveroccupied: widget.driveroccupied, operationalcenterid: widget.operationalcenterid,),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('PickandGO - Pickup Delivery'),
          ),
          body: Container(
            color: Colors.white,
            child: Column(children:  [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.person,
                    size: 28),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text('Driver Profile',
                      style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),),
                  ],

                ),
              ),

            ]),
          )
      ),

    );
  }

}











