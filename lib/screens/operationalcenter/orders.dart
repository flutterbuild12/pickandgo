
import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/searchPackage.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawer.dart';



class Orders extends StatefulWidget {
  final String rool;
  final String email;
  final String id;

  Orders({required this.rool, required this.email, required this.id});

  //const Homepagey({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

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
                    Icon(Icons.local_shipping),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text('Orders',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),


                  ],
                ),

              ),
              MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPackage()));
                },
                color: Colors.black,
                shape: StadiumBorder(),
                child: Text("Update Package Details",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

            ]),
          )
      ),

    );
  }

}











