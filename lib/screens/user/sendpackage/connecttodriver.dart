import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/homepage.dart';
import 'package:pickandgo/screens/user/sendpackage/packagedetails.dart';

import 'package:pickandgo/services/routingpage.dart';


class ConnectToDriver extends StatefulWidget {

  final String receiverName;
  final String receiverEmail;
  final String receiverAddress;
  final String receiverPostalCode;
  final String receiverContactNo;
  final String packageDesc;
  final String packageLength;
  final String packageHeight;
  final String packageWidth;
  final String packageWeight;

  ConnectToDriver(this.receiverName, this.receiverEmail, this.receiverAddress, this.receiverPostalCode, this.receiverContactNo,
      this.packageDesc, this.packageLength, this.packageHeight, this.packageWidth, this.packageWeight);

  @override
  _ConnectToDriverState createState() => _ConnectToDriverState();
}

class _ConnectToDriverState extends State<ConnectToDriver> {
  // List items = [];
  //
  // final controllerName = TextEditingController();
  // final controllerAge = TextEditingController();
  // final controllerDate = TextEditingController();
  // String categoryvalue = "";

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Connect To Driver'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                    builder: (_) => PackageDetails(widget.receiverName, widget.receiverEmail, widget.receiverAddress,
                        widget.receiverPostalCode, widget.receiverContactNo),),);
                },
                // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          //title: Text('${widget.packageDesc}'),
          actions: [
            IconButton(
              onPressed: () {
                _db.logout(context);
                Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (_) => RoutePage(),
                ),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white10,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.82,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: const <Widget> [
                              Padding(
                                padding:  EdgeInsets.all(1),
                                child: Text('Connecting you to driver...',
                                  style: TextStyle(fontSize: 40.0),),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              //Text('The driver may contact the recepient to complete the delivery.', style: TextStyle(fontSize: 17.0),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            // if you need this
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 120,
                            child: Column(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text('Delivery Cost - LKR 450', style: TextStyle(fontSize: 20),),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text('Send packages to friends and family. Only accepting COD at the moment.', style: TextStyle(fontSize: 17, color: Colors.black54),),
                                ),

                              ],
                            ),


                          ),

                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // MaterialButton(
                            //   shape: const RoundedRectangleBorder(
                            //       borderRadius:
                            //       BorderRadius.all(Radius.circular(10.0))),
                            //   elevation: 5.0,
                            //   height: 40,
                            //   onPressed: () {
                            //     setState(() {
                            //       visible = true;
                            //     });
                            //     signIn(emailController.text,
                            //         passwordController.text);
                            //   },
                            //   child: const Text(
                            //     "Login",
                            //     style: const TextStyle(
                            //       fontSize: 20,
                            //     ),
                            //   ),
                            //   color: Colors.white,
                            // ),
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                const snackBar = SnackBar(
                                  content: Text('Pick up has been confirmed! Our delivery person will be at your doorstep within the next 1 hour earliest.'),
                                  // action: SnackBarAction(
                                  //   onPressed: () {
                                  //     // Some code to undo the change.
                                  //   },
                                  // ),
                                );
                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RoutePage(),
                                  ),
                                );
                              },
                              color: Colors.black,
                              child: const Text(
                                "Confirm Pick Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text('${widget.receiverName}, ${widget.receiverEmail}, ${widget.receiverAddress}'),
                        Text('${widget.packageDesc}, ${widget.packageLength}, ${widget.packageHeight},'),
                        const SizedBox(
                          height: 20,
                        ),

                      ],
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


