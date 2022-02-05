import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/user/sendpackage/connectwithdriver.dart';
import 'package:pickandgo/services/routingpage.dart';



class PackageDetails extends StatefulWidget {

  // final String rool;
  // final String email;
  // final String id;
  //
  // SendPackage({required this.rool, required this.email, required this.id});

  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
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
                  builder: (_) => PackageDetailsForm(),
                ),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: PackageDetailsForm(),
      ),
    );
  }
}

class PackageDetailsForm extends StatefulWidget {
  @override
  _PackageDetailsFormState createState() => _PackageDetailsFormState();
}

class _PackageDetailsFormState extends State<PackageDetailsForm> {
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
                  .height * 0.95,
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
                                child: Text('What do you wish to send?',
                                  style: TextStyle(fontSize: 40.0),),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('If default maximum package weight exceeds, you will'
                                  'be billed separately.', style: TextStyle(fontSize: 17.0),)
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
                            hintText: 'Product Description',
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
                              return "Product description cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // maxLines: 5,
                          // minLines: 3,
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Package Length',
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
                              return "Package weight cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Package Height',
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
                              return "Package height cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Package Width',
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
                              return "Package width cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Package Weight (Max 20kg)',
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
                              return "Package weight cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
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
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ConnectToDriver(),
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
