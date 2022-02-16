import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickandgo/screens/loginpage.dart';
import 'package:pickandgo/screens/operationalcenter/opc_dashboard.dart';
import 'package:pickandgo/screens/operationalcenter/opc_assigndropoffdriver.dart';
import 'package:pickandgo/screens/operationalcenter/opc_pastpackages.dart';
import '../../../databasehelper.dart';
import '../opc_customers.dart';
import '../deliverypersons.dart';
import '../opc_driverlist.dart';
import '../opc_profile.dart';
import '../opc_orders.dart';


class NavigationDrawerWidgetCenter extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  final String? uid;
  final String? name;
  final String? operationalcenterid;
  final String mobile;
  final String email;
  final String address;
  final String status;
  final String driverid;

  NavigationDrawerWidgetCenter(this.uid,this.operationalcenterid, this.name, this.mobile, this.address, this.email, this.status, this.driverid);

  final admin_email = FirebaseAuth.instance.currentUser?.email;

  @override

  DatabaseHelper _db = DatabaseHelper();

  Widget build(BuildContext context) {
    // final name = 'Admin';
    // final email = 'admin@pickandgo.lk';

    final urlImage =
        'https://static.vecteezy.com/system/resources/previews/002/318/271/non_2x/user-profile-icon-free-vector.jpg';

    return Drawer(
      child: Material(
        //color: Color.fromRGBO(50, 75, 205, 1),
        color: Colors.black87,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: "Operational Center",
              email: "${admin_email}",
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OpProfile(uid, operationalcenterid, name, email, mobile, status, address, driverid),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  // buildSearchField(),
                  // const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Dashboard',
                    icon: Icons.dashboard,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Orders',
                    icon: Icons.local_shipping,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Past Orders',
                    icon: Icons.assignment_turned_in,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Delivery Persons',
                    icon: Icons.delivery_dining,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Assign Driver',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Customers',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  // const SizedBox(height: 24),
                  // buildMenuItem(
                  //   text: 'Plugins',
                  //   icon: Icons.account_tree_outlined,
                  //   onClicked: () => selectedItem(context, 4),
                  // ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context,6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //build header
  Widget buildHeader({
     required String urlImage,
     required String name,
     required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
     required String text,
     required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard(uid, operationalcenterid, name, email, mobile, status, email, driverid),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Orders(uid, operationalcenterid, name, email, mobile, status, email, driverid),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OPC_PastPackages(uid, operationalcenterid, name, email, mobile, status, email, driverid),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Opc_DriverList(uid, operationalcenterid, name, email, mobile, status, email, driverid),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AssignDropOffDriver(uid!, operationalcenterid!, name, email, mobile, status, email, driverid),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Customers(uid!, operationalcenterid!, name!, email, mobile, status, email, driverid),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        _db.logout(context);
        break;
    }
  }
}