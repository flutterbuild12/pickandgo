
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawercenter.dart';


class Orders extends StatefulWidget {
  String? uid;
  String? operationalcenterid;
  String? email;
  String? name;
  String? mobile;
  String? address;
  String? status;
  String? driverid;

  //constructor


  Orders(
  this.uid,
  this.name,
  this.email,
  this.mobile,
  this.address,
  this.status,
  this.operationalcenterid,
      this.driverid);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          drawer: NavigationDrawerWidgetCenter(widget.uid, widget.operationalcenterid, widget.name, widget.email!,
          widget.mobile!, widget.status!, widget.address!, widget.driverid!),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('PickandGO - Operational Center'),
          ),
          body: Container(
            color: Colors.white,
            child: Column(children:  [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                     Icon(Icons.local_shipping,
                    size: 28),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Orders',
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              ///package/order list view
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('package')
                      .where('packageDroppedOperationalCenter', isEqualTo: true)
                      .where('operationalcenterid',
                      isEqualTo: widget.operationalcenterid)
                      .snapshots(),

                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          return Card ( child: ListTile(
                            title: Row(
                              children: <Widget>[
                                IconButton(onPressed: (){}, icon: Icon(Icons.local_shipping, size: 28),),
                                Flexible(
                                  child: Text(snapshot
                                      .data!.docs[index]['packageid']
                                      .toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                              ],
                            ),
                            subtitle: Text('User Id:' + snapshot
                                .data!.docs[index]['userid']
                                .toString(),
                            style: TextStyle(fontSize: 14),),

                            ///package/order view navigation
                            trailing: Column(
                              children: <Widget>[
                                   IconButton(
                                    icon: const Icon(Icons.arrow_forward),
                                    onPressed: () {
                                      /* Your code */
                                    },
                                  )
                              ],
                            ),
                          ),
                          );
                        });
                  },
                ),
              )
            ]),

          ),

      ),

    );
  }

}











