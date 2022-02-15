import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawer.dart';



class Dashboard extends StatefulWidget {
  final String rool;
  final String email;
  final String id;

  Dashboard({required this.rool, required this.email, required this.id});

  //const Homepagey({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

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
                  Icon(Icons.dashboard),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text('Dashboard',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
                ],),),
              SizedBox(
                height: 20,
              ),
                ///dashboard cards
               Card(
                    color: Color(0xFFDAF7A6),
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
                          title: Text('134',
                          style: TextStyle(fontSize: 28),),
                          subtitle: Text('Total Orders',
                            style: TextStyle(fontSize: 20, )),
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Color(0xFF9FD3EE),
                  child: InkWell(
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                        child: Padding(padding: EdgeInsets.all(10),
                        child: ListTile(
                          leading:
                          Padding(
                            child: Icon(Icons.payments,
                              color: Colors.black87,
                              size: 40,),
                            padding: EdgeInsets.all(2), ),
                          title: Text('88',
                            style: TextStyle(fontSize: 28, ),),
                          subtitle: Text('Total Deliveries',  style: TextStyle(fontSize: 20, )),
                        ),

                        ),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: Color(0xFFEEA8AE),
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
              SizedBox(
                height: 20,
              ),
              Card(
                color: Color(0xFFA37FA8),
                child: InkWell(
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: Padding(padding: EdgeInsets.all(10),
                    child: ListTile(
                      leading:
                      Padding(
                        child: Container(
                          child: Icon(Icons.payments,
                            color: Colors.black87,
                            size: 40,),
                        ),
                        padding: EdgeInsets.all(2), ),
                      title: Text('LKR. 122,000',
                        style: TextStyle(fontSize: 28, ),),
                      subtitle: Text('Total Revenue',  style: TextStyle(fontSize: 20, )),
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
