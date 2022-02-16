import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/pickupdriver/widgets/navigationdrawerpickupdriver.dart';


class DropoffPastDeliveries extends StatefulWidget {
  final String role;
  final String email;
  final String id;
  final String name;
  bool? driveroccupied;
  String? operationalcenterid;

  DropoffPastDeliveries(
      {
        required this.id,
        required this.email,
        required this.role,
        required this.name,
        required this.driveroccupied,
        required this.operationalcenterid});
  @override
  _DropoffPastDeliveriesState createState() => _DropoffPastDeliveriesState();
}

class _DropoffPastDeliveriesState extends State<DropoffPastDeliveries> {

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          drawer:  NavigationDrawerWidget(name: widget.name, role: widget.role, id: widget.id,
            email: widget.email, driveroccupied: widget.driveroccupied, operationalcenterid: widget.operationalcenterid,),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('PickandGO - Dropoff Delivery'),
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
                    Icon(Icons.check_circle_outline_rounded,
                    size: 28),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('Past Deliveries',
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











