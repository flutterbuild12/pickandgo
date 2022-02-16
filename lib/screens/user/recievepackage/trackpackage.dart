import 'package:flutter/material.dart';
import 'package:pickandgo/screens/user/recievepackage/track.dart';

class TrackPackageStatus extends StatefulWidget {
  const TrackPackageStatus({Key? key}) : super(key: key);

  @override
  _TrackPackageStatusState createState() => _TrackPackageStatusState();
}

class _TrackPackageStatusState extends State<TrackPackageStatus> {

  final TextEditingController _id = TextEditingController();

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
                child: Center(
                  child: Image(
                    width: 200,
                    height: 200,
                    image: AssetImage(
                        'assets/SeekPng.com_delivery-png_1145491.png'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pick & go',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Text(
                  "Pic & Go is Sri Lanka's no 01 unique delivery service. We offering the cheapest, quickest and safest service in door to door delivery.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              // const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _id,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Package ID is missing';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter tracking code (Order ID)",
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 380,
                height: 50,
                color: Colors.white,
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: Colors.black)))),
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Track(id: _id.text,)));
                    }
                  },
                  child: const Text(
                    'Track',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
