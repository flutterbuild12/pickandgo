import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawercenter.dart';


class Opc_DriverList extends StatefulWidget {

  String? uid;
  String? operationalcenterid;
  String? email;
  String? name;
  String? mobile;
  String? address;
  String? status;
  String? driverid;

  //constructor

  Opc_DriverList(
      this.uid,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.status,
      this.operationalcenterid,
      this.driverid);

  @override
  _Opc_DriverListState createState() => _Opc_DriverListState();
}

class _Opc_DriverListState extends State<Opc_DriverList> {

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  String dropdownValue = "Active";

  DatabaseHelper _db = DatabaseHelper();

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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.delivery_dining),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Delivery Persons',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ],),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
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

                          return Card (child: ListTile(
                            title: Row(
                              children: <Widget>[
                                IconButton(onPressed: (){}, icon: Icon(Icons.card_giftcard_outlined),),
                                Flexible(
                                  child: Text(snapshot
                                      .data!.docs[index]['userid']
                                      .toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text('User Id:' + snapshot
                                .data!.docs[index]['userid']
                                .toString(),
                            style:  const TextStyle(fontSize: 15),),
                            // trailing: const Padding(
                            //   padding: EdgeInsets.all(13.0),
                            //   child: Text("asd"),
                            // ),
                          ),);
                        });
                  },
                ),
              )
            ]),
          )
      ),
    );
  }

}
