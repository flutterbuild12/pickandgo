import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawer.dart';
import 'package:pickandgo/screens/user/recievepackage/trackpackage.dart';
import 'package:pickandgo/screens/user/sendpackage/receiverdetails.dart';

import '../loginpage.dart';


class DeliveryPersons extends StatefulWidget {
  final String rool;
  final String email;
  final String id;

  DeliveryPersons({required this.rool, required this.email, required this.id});

  //const Homepagey({Key? key}) : super(key: key);

  @override
  _DeliveryPersonsState createState() => _DeliveryPersonsState();
}

class _DeliveryPersonsState extends State<DeliveryPersons> {

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          drawer: NavigationDrawerWidget(id: widget.id, email: widget.email, rool: widget.rool,),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('Pick and Go'),
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
                    Icon(Icons.people),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Delivery Persons',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
                  ],),),
            ]),
          )
      ),
    );
  }

}
