import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/pickupdriver/widgets/navigationdrawerpickupdriver.dart';


class DropoffDriverDashboard extends StatefulWidget {
  final String role;
  final String email;
  final String id;
  final String name;
  bool? driveroccupied;
  String? operationalcenterid;

  DropoffDriverDashboard(
      {
        required this.id,
        required this.email,
        required this.role,
        required this.name,
        required this.driveroccupied,
        required this.operationalcenterid});
  @override
  _DropoffDriverDashboardState createState() => _DropoffDriverDashboardState();
}

class _DropoffDriverDashboardState extends State<DropoffDriverDashboard> {

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
              color: Colors.white60,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.dashboard,
                      size: 28),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Dashboard',
                        style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),),
                    ],),),
                SizedBox(
                  height: 20,
                ),
                ///dashboard cards
                Card(
                  color: Color(0xFFC8A8BA),
                  child: InkWell(
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: Padding(padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading:
                        Padding(
                          child: Icon(Icons.local_shipping,
                            color: Colors.black87,
                            size: 40,),
                          padding: EdgeInsets.all(2), ),
                        title: Text('12',
                          style: TextStyle(fontSize: 28),),
                        subtitle: Text('Active Deliveries',
                            style: TextStyle(fontSize: 20, )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Color(0xFFE1D580),
                  child: InkWell(
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: Padding(padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading:
                        Padding(
                          child: Icon(Icons.check_circle_outline,
                            color: Colors.black87,
                            size: 40,),
                          padding: EdgeInsets.all(2), ),
                        title: Text('188',
                          style: TextStyle(fontSize: 28, ),),
                        subtitle: Text('Completed Deliveries',  style: TextStyle(fontSize: 20, )),
                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Color(0xFFBCBCDA),
                  child: InkWell(
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child:  const Padding(padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading:
                        Padding(
                          child: Icon(Icons.people,
                            color: Colors.black87,
                            size: 40,),
                          padding: EdgeInsets.all(2), ),
                        title: Text('52',
                          style: TextStyle(fontSize: 28, ),),
                        subtitle: Text('No of Delivery Persons',  style: TextStyle(fontSize: 20, )),
                      ),

                    ),
                  ),
                ),

              ],
              )
          ),
      ),

    );
  }

}











