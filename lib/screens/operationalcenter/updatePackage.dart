import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdatePackage extends StatefulWidget {

  final String pkgId;

  const UpdatePackage({Key? key, required this.pkgId}) : super(key: key);

  @override
  _UpdatePackageState createState() => _UpdatePackageState();
}

class _UpdatePackageState extends State<UpdatePackage> {

  bool _pickUpReqValue = true;
  bool _packagepickedUpValue = true;
  bool _packageDroppedOperationalCenterValue = true;
  bool _packageLeftOperationalCenterValue = true;
  bool _packageDeliveredValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection("package").doc(widget.pkgId).snapshots(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                var data = snapshot.data!;

                _pickUpReqValue = data['pickupreqaccepted'];
                _packagepickedUpValue = data['packagePickedUp'];
                _packageDroppedOperationalCenterValue = data['packageDroppedOperationalCenter'];
                _packageLeftOperationalCenterValue = data['packageLeftOperationalCenter'];
                _packageDeliveredValue = data['packageDelivered'];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("Pickup Address : ${data['pickupAddress']}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Receiver Address : ${data['receiverAddress']}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Receiver Name : ${data['receiverName']}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Total Cost : ${data['totalCost']}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Email : ${data['receiverEmail']}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Mobile : ${data['receiverContactNo']}"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Pick Up Req Accepted?"),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
                            child: DropdownButton(
                              value: _pickUpReqValue,
                              items: const [
                                DropdownMenuItem(
                                  child: Text("True"),
                                  value: true,
                                ),
                                DropdownMenuItem(
                                  child: Text("False"),
                                  value: false,
                                ),
                              ],

                              onChanged: (bool? value) {
                                setState(() {
                                  FirebaseFirestore.instance.collection('package').doc(widget.pkgId).update({
                                    'pickupreqaccepted':value,
                                  });
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Package Picked Up?"),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
                            child: DropdownButton(
                              value: _packagepickedUpValue,
                              items: const [
                                DropdownMenuItem(
                                  child: Text("True"),
                                  value: true,
                                ),
                                DropdownMenuItem(
                                  child: Text("False"),
                                  value: false,
                                ),
                              ],

                              onChanged: (bool? value) {
                                setState(() {
                                  FirebaseFirestore.instance.collection('package').doc(widget.pkgId).update({
                                    'packagePickedUp':value,
                                  });
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Package Dropped at Op-Center ?"),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
                            child: DropdownButton(
                              value: _packageDroppedOperationalCenterValue,
                              items: const [
                                DropdownMenuItem(
                                  child: Text("True"),
                                  value: true,
                                ),
                                DropdownMenuItem(
                                  child: Text("False"),
                                  value: false,
                                ),
                              ],

                              onChanged: (bool? value) {
                                setState(() {
                                  FirebaseFirestore.instance.collection('package').doc(widget.pkgId).update({
                                    'packageDroppedOperationalCenter':value,
                                  });
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Packge Left Op-Center?"),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
                            child: DropdownButton(
                              value: _packageLeftOperationalCenterValue,
                              items: const [
                                DropdownMenuItem(
                                  child: Text("True"),
                                  value: true,
                                ),
                                DropdownMenuItem(
                                  child: Text("False"),
                                  value: false,
                                ),
                              ],

                              onChanged: (bool? value) {
                                setState(() {
                                  FirebaseFirestore.instance.collection('package').doc(widget.pkgId).update({
                                    'packageLeftOperationalCenter':value,
                                  });
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Package Delivered ?"),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
                            child: DropdownButton(
                              value: _packageDeliveredValue,
                              items: const [
                                DropdownMenuItem(
                                  child: Text("True"),
                                  value: true,
                                ),
                                DropdownMenuItem(
                                  child: Text("False"),
                                  value: false,
                                ),
                              ],

                              onChanged: (bool? value) {
                                setState(() {
                                  FirebaseFirestore.instance.collection('package').doc(widget.pkgId).update({
                                    'packageDelivered':value,
                                  });
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }else{
                return const Center(
                  child: Text("Please Wait..."),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
