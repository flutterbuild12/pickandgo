import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawer.dart';
import '../../databasehelper.dart';


class AdminProfile extends StatefulWidget {
  //const AccountProfile({Key? key}) : super(key: key);

  final String rool;
  final String email;
  final String id;


  final admin_email = FirebaseAuth.instance.currentUser?.email;

  AdminProfile({required this.rool, required this.email, required this.id});

  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class FirebaseUser {
}

class _AdminProfileState extends State<AdminProfile> {
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
                    Icon(Icons.person),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Admin Profile',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
                  ],),),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 10.0,
                      height: 60.0,
                    ),
                    Text('${widget.admin_email}',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.0,
                      height: 60.0,
                    ),

                  ],),),

            ]),
          )
      ),
    );
  }
}
