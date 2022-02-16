import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawercenter.dart';
import '../../databasehelper.dart';
import 'opc_addpackagesdropoffdriver.dart';



class AssignDropOffDriver extends StatefulWidget {
  //const AssignDropOffDriver({Key? key}) : super(key: key);

  String id;
  String opid;
  String? email;
  String? name;
  String? mobile;
  String? address;
  String? status;
  String driverid;

  AssignDropOffDriver(
      this.id,
      this.opid,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.status,
      this.driverid);



  @override
  _AssignDropOffDriverState createState() => _AssignDropOffDriverState();
}

class _AssignDropOffDriverState extends State<AssignDropOffDriver> {
  DatabaseHelper _db = DatabaseHelper();
  final controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      drawer: NavigationDrawerWidgetCenter(widget.id, widget.opid, widget.name, widget.email!,
          widget.mobile!, widget.status!, widget.address!, widget.driverid),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('PickandGO - Operational Center'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Icon(Icons.person,
                  color: Colors.black87, size: 28,),
                SizedBox(
                  width: 6.0,
                ),
                Text('Assign Driver',
                  style: TextStyle(fontSize: 21,
                      fontWeight: FontWeight.bold, color: Colors.black87),),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('role', isEqualTo: "DropoffDriver")
                  .where('operationalcenterid',
                  isEqualTo: widget.opid)
                  .where('driveroccupied',
                  isEqualTo: false)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AddPackagesDropOffDriver(
                                    //userId
                                      widget.id,
                                      //driverid
                                      snapshot
                                      .data!.docs[index]['uid']
                                      .toString(),
                                      //op id
                                      widget.opid,
                                    widget.address,
                                    widget.email, widget.name, widget.mobile, widget.status,
                                  )));
                        },
                           child: Card(child: ListTile(
                          title: Row(
                            children: <Widget>[
                              IconButton(onPressed: (){}, icon: Icon(Icons.account_circle,
                              size: 32),),
                              Flexible(
                                child: Text(snapshot
                                    .data!.docs[index]['name']
                                    .toString(),
                                  overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 18)
                                ),
                              ),

                            ],
                          ),
                          subtitle: Text(
                            "Driver Id: " +
                            snapshot
                              .data!.docs[index]['uid']
                              .toString(),
                          style: TextStyle(fontSize: 13.7)),
                          trailing: Column(
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.arrow_forward,),
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => AddPackagesDropOffDriver(
                                            //userId
                                            widget.id,
                                            //driverid
                                            snapshot
                                                .data!.docs[index]['uid']
                                                .toString(),
                                            //op id
                                            widget.opid,
                                            widget.address,
                                            widget.email, widget.name, widget.mobile, widget.status,
                                          )));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      );
                    });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // TextField(
          //
          //   onSubmitted: (value) async{
          //
          //
          //     controllers.text = value;
          //     Navigator.of(context).push(
          //         MaterialPageRoute(
          //             builder: (context) => AddPackagesDropOffDriver(
          //                 widget.id,widget.opid,value
          //             )));
          //
          //   },
          //
          //   controller: controllers,
          //
          // ),

        ],
      ),
    ));
  }
}
