import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

String Lname, address, email, Fname, name, phone;
List userData;

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  getData() async {
    print("============");
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection("users");
    DocumentSnapshot user =
        await usersRef.doc(FirebaseAuth.instance.currentUser.uid).get();
    email = user['email'];
    Lname = user['last_name'];
    Fname = user['first_name'];
    name = Fname + ' ' + Lname;
    address = user['address'];
    phone = user['phone_number'];
  }

  delete() async {
    User user = FirebaseAuth.instance.currentUser;
    user.delete();
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection("users");
    await usersRef.doc(FirebaseAuth.instance.currentUser.uid).delete();
    print('Account deleted');
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacementNamed(context, SignInScreen.routeName);
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete account"),
            content: SingleChildScrollView(
                child: ListBody(children: <Widget>[
              GestureDetector(
                child: Text("delete", style: TextStyle(color: Colors.red)),
                onTap: () {
                 
                },
              ),
              Padding(padding: EdgeInsets.all(8)),
              GestureDetector(
                  child: Text("annuler", style: TextStyle(color: Colors.grey)),
                  onTap: () {
                    print("annuler");
                    Navigator.pop(context, false);
                  }),
            ])),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //for circle avtar image
          _getHeader(),
          SizedBox(
            height: 10,
          ),
          _profileName(name),
          SizedBox(
            height: 14,
          ),
          _heading("Personal Details"),
          SizedBox(
            height: 6,
          ),
          _detailsCard(),
          SizedBox(
            height: 10,
          ),
          Spacer(),
          logoutButton()
        ],
      )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"))
                // color: Colors.orange[100],
                ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.email),
              title: Text(email),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(phone),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(address),
            )
          ],
        ),
      ),
    );
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.dashboard_customize),
              title: Text("About Us"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.topic),
              title: Text("Change Theme"),
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return InkWell(
      onTap: () async {
        await showChoiceDialog(context);
      },
      child: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Delete account",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}