import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawercenter.dart';


class DeliveryPersons extends StatefulWidget {

  String? uid;
  String? operationalcenterid;
  String? email;
  String? name;
  String? mobile;
  String? address;
  String? status;
  String? driverid;

  //constructor

  DeliveryPersons(
      this.uid,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.status,
      this.operationalcenterid,
      this.driverid);

  @override
  _DeliveryPersonsState createState() => _DeliveryPersonsState();
}

class _DeliveryPersonsState extends State<DeliveryPersons> {

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
              Stack(
                children: [
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(1),
                            child: Text(
                              'Driver Details',
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          TextFormField(
                            controller: nameController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Name",
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 15.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: emailController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 15.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: mobileController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Mobile Number",
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 15.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0,right: 4.0),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,

                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0

                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),

                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>['Active', 'Blocked']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            elevation: 5.0,
                            height: 40,
                            onPressed: () {

                              /*

                      ---Use this navigator to send the driver ID using the class parameters---

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditDriverDetails(driverId: "THIS IS DRIVER ID",)),);


                     ---then change the collection path

                     ---doc path is using the previous mentioned class parameter so no need to worry, make sure when you call page navigator, provide the driver ID that you want to change the details

                     */

                              FirebaseFirestore.instance.collection("users").doc(widget.driverid).update({

                                "status":dropdownValue,
                              }).then((value) {

                                const snackBar = SnackBar(
                                  content: Text('Driver Details has been Updated Successfully', style: TextStyle(color: Colors.lightGreenAccent),),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                Navigator.pop(context,);
                              });
                            },
                            color: Colors.black,
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )
      ),
    );
  }

}
