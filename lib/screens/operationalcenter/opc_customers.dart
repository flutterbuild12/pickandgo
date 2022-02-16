
import 'package:pickandgo/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/models/model.dart';
import 'package:pickandgo/screens/operationalcenter/opc_viewcustomerdetails.dart';
import 'package:pickandgo/screens/operationalcenter/widgets/navigationdrawercenter.dart';



class Customers extends StatefulWidget {
  String? uid;
  String? operationalcenterid;
  String? email;
  String? name;
  String? mobile;
  String? address;
  String? status;
  String driverid;

  //constructor
  Customers(
        this.uid,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.status,
        this.operationalcenterid,
      this.driverid);


  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
          drawer: NavigationDrawerWidgetCenter(widget.uid, widget.operationalcenterid, widget.name, widget.email!,
              widget.mobile!, widget.status!, widget.address!, widget.driverid),
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
                    Icon(Icons.people),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Customers',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
                  ],

                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: StreamBuilder<List<UserModel>>(
                  //accessing the readRecipes method from DatabaseHelper class
                    stream: _db.readCustomers(),
                    initialData: [],
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error yo ${snapshot.error}");
                      }
                      //check if we have data
                      if (snapshot.hasData) {
                        //accessing data
                        final users = snapshot.data!;
                        return ListView(
                          children: users.map(buildUser).toList(),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),

            ]),
          ),
      ),

    );
  }
  Widget buildUser(UserModel userModel) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                // TaskCardWidget(id: user.id, name: user.ingredients,)
                ViewCustomerDetails(
                 //  uid: userModel.uid,
                 // name: userModel.name,
                 // email: userModel.email,
                 // mobile: userModel.mobile,
                 //  status: userModel.status,
                 //  operationalcenterid: userModel.operationalcenterid,
                  userModel.uid!,
                  userModel.name!,
                  userModel.email!,
                  userModel.mobile!,
                  userModel.status!,
                  userModel.operationalcenterid!,
                )));
      },
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              //padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ' ${userModel.name}',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Image(image: AssetImage("assets/user.png"), height: 30.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Id: ${userModel.uid}',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}











