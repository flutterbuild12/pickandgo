import 'package:flutter/material.dart';
import 'package:pickandgo/screens/operationalcenter/updatePackage.dart';

class SearchPackage extends StatefulWidget {
  const SearchPackage({Key? key}) : super(key: key);

  @override
  _SearchPackageState createState() => _SearchPackageState();
}

class _SearchPackageState extends State<SearchPackage> {

  final TextEditingController _id = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
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
                        hintText: "Enter Package ID",
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
                    if (formKey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePackage(pkgId:_id.text,)));
                    }
                  },
                  child: const Text(
                    'Update Package',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
