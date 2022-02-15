import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawer.dart';
import 'package:pickandgo/screens/user/recievepackage/trackpackage.dart';
import 'package:pickandgo/screens/user/sendpackage/receiverdetails.dart';

import '../loginpage.dart';


class Branches extends StatefulWidget {
  final String rool;
  final String email;
  final String id;

  Branches({required this.rool, required this.email, required this.id});

  //const Homepagey({Key? key}) : super(key: key);

  @override
  _BranchesState createState() => _BranchesState();
}

class _BranchesState extends State<Branches> {

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          drawer: NavigationDrawerWidget(id: widget.id, email: widget.email, rool: widget.rool,),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('Pick and Go'),
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       _db.logout(context);
            //       Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            //         builder: (_) => LoginPage(),
            //       ),
            //       );
            //     },
            //     icon: Icon(Icons.logout),
            //   ),
            // ],
          ),
          body: Container(
            color: Colors.white,
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.account_tree_outlined),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text('Branches',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
                  ],),),
            ]),
          )
      ),
    );
  }

}
