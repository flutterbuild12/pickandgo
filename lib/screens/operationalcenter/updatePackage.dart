import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdatePackage extends StatefulWidget {

  final String pkgId;

  const UpdatePackage({Key? key, required this.pkgId}) : super(key: key);

  @override
  _UpdatePackageState createState() => _UpdatePackageState();
}

class _UpdatePackageState extends State<UpdatePackage> {

  final TextEditingController _pickupAddress = TextEditingController();
  final TextEditingController _recieverAddress = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _total = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

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

                _pickupAddress.text = data['pickupAddress'];
                _recieverAddress.text = data['receiverAddress'];
                _name.text = data['receiverName'];
                _total.text = data['totalCost'].toString();
                _email.text = data['receiverEmail'];
                _mobile.text = data['receiverContactNo'];


                _pickUpReqValue = data['pickupreqaccepted'];
                _packagepickedUpValue = data['packagePickedUp'];
                _packageDroppedOperationalCenterValue = data['packageDroppedOperationalCenter'];
                _packageLeftOperationalCenterValue = data['packageLeftOperationalCenter'];
                _packageDeliveredValue = data['packageDelivered'];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _pickupAddress,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          labelText: "Pickup Address",
                          fillColor: Colors.white70,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _recieverAddress,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          labelText: "Receiver Address",
                          fillColor: Colors.white70,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _name,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          labelText: "Receiver Name",
                          fillColor: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _total,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          labelText: "Total Cost",
                          fillColor: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _email,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          labelText: "Email Address",
                          fillColor: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _mobile,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          labelText: "Contact Number",
                          fillColor: Colors.white70,
                        ),
                      ),
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
