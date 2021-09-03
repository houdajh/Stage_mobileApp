import 'package:flutter/material.dart';

import 'components/body.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = "/account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "my account",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.red,
            Colors.grey[800],
            Colors.white,
            Colors.white,
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          child: Profile(),
        ));
  }
}