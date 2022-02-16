import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Track extends StatefulWidget {

  final String id;

  const Track({Key? key, required this.id}) : super(key: key);

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("package").doc(widget.id).snapshots(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var data = snapshot.data!;
                  return Column(
                    children: [
                      Container(
                        child: const Image(
                          image: AssetImage(
                              'assets/SeekPng.com_tracking-icon-png_3818797.png'),
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Tracking',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Now you can track your shipment',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(125, 0, 10, 0),
                            child: data['pickupreqaccepted'] == true ? ReusableContainer2() : ReusableContainer(),
                          ),
                          const Text('Order confirmed'),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_downward,
                        size: 40,
                      ),
                      // Padding(
                      //   padding:EdgeInsets.fromLTRB(10, 0, 10.0, 0)
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(125, 0, 10, 0),
                            child: data['packagePickedUp'] == true ? ReusableContainer2() : ReusableContainer(),
                          ),
                          // SizedBox(width: 45),
                          Text('Dispatched'),
                        ],
                      ),
                      // ),
                      const Icon(
                        Icons.arrow_downward,
                        size: 40,
                      ),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(125, 0, 10, 0),
                            child: data['packageDroppedOperationalCenter'] == true ? ReusableContainer2() : ReusableContainer(),
                          ),
                          // SizedBox(width: 50),
                          Text('In transist'),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_downward,
                        size: 40,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(125, 0, 10, 0),
                            child: data['packageDroppedOperationalCenter'] == true ? ReusableContainer2() : ReusableContainer(),
                          ),
                          // SizedBox(width: 42),
                          Text('Destination'),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_downward,
                        size: 40,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(125, 0, 10, 0),
                            child: data['packageDelivered'] == true ? ReusableContainer2() : ReusableContainer(),
                          ),
                          Text(
                            'Delivered',
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                }else{
                  return const Center(
                    child: Text("Loading Tracking Information...!"),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
    );
  }
}


class ReusableContainer2 extends StatelessWidget {
  const ReusableContainer2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(color: Colors.lightGreen),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: const Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
