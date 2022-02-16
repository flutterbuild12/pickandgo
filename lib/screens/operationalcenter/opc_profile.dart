import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawercenter.dart';


class OpProfile extends StatefulWidget {

  String? uid;
  String? operationalcenterid;
  String? email;
  String? name;
  String? mobile;
  String? address;
  String? status;
  String driverid;
  //constructor
  OpProfile(
      this.uid,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.status,
      this.operationalcenterid,
      this.driverid);

  @override
  _OpProfileState createState() => _OpProfileState();
}

class _OpProfileState extends State<OpProfile> {

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          drawer:  NavigationDrawerWidgetCenter(widget.uid, widget.operationalcenterid, widget.name, widget.email!,
              widget.mobile!, widget.status!, widget.address!, widget.driverid),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('PickandGO - Operational Center'),
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











