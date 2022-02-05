import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/user/sendpackage/packagedetails.dart';
import 'package:pickandgo/services/routingpage.dart';



class SendPackage extends StatefulWidget {

  // final String rool;
  // final String email;
  // final String id;
  //
  // SendPackage({required this.rool, required this.email, required this.id});

  @override
  _SendPackageState createState() => _SendPackageState();
}

class _SendPackageState extends State<SendPackage> {
  List items = [];
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();
  String categoryvalue = "";

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('Pick Up Request'),
            actions: [
              IconButton(
                onPressed: () {
                  _db.logout(context);
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                    builder: (_) => ReceiverDetailsForm(),
                  ),
                  );
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: ReceiverDetailsForm(),
      ),
    );
  }
}

class ReceiverDetailsForm extends StatefulWidget {
  @override
  _ReceiverDetailsFormState createState() => _ReceiverDetailsFormState();
}

class _ReceiverDetailsFormState extends State<ReceiverDetailsForm> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController recNameController = new TextEditingController();
  final TextEditingController recEmailController = new TextEditingController();
  final TextEditingController recAddressController = new TextEditingController();
  final TextEditingController recPostalCodeController = new TextEditingController();
  final TextEditingController recContactController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  .height * 0.98,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(22),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: const <Widget> [
                              Padding(
                                padding: EdgeInsets.all(1),
                                child: Text('Who is receiving the package?',
                                  style: TextStyle(fontSize: 40.0),),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('The driver may contact the recepient to complete the delivery.', style: TextStyle(fontSize: 17.0),)
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Receiver Name',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),

                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Receiver name cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            recNameController.text = value!;
                          },
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: recEmailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Receiver Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),

                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Receiver email cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            recEmailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: recAddressController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Receiver Address',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Receiver address cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            recAddressController.text = value!;
                          },
                          keyboardType: TextInputType.streetAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: recPostalCodeController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Receiver Postal Code',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Receiver postal code cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            recPostalCodeController.text = value!;
                          },
                          keyboardType: TextInputType.number,
                        ),


                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: recContactController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Receiver Contact No',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Receiver name cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            recContactController.text = value!;
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PackageDetails(),
                                    ),
                                  );
                                }
                              },
                              color: Colors.black,
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  void signIn(String email, String password) async {
    //checking the username and password entered
    if (_formkey.currentState!.validate()) {
      //if valid this code block will run
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,

        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RoutePage(),
          ),
        );
        print("Logged in Successfully with ${email} and $password");
      }
      //if invalid catch the error
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: const [
                Icon(
                  Icons.error_outline,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 20),
                Expanded(child: Text('No user found for that email.')),
              ],
            ),
          ));
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: const [
                Icon(
                  Icons.error_outline,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Text('Wrong password provided for that user.')),
              ],
            ),
          ));
        }
      }
    }
  }
  }
