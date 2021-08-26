import 'package:flutter/material.dart';
import 'package:shop_app/screens/deleteAccount/components/body.dart';

import 'components/body.dart';

class DeleteScreen extends StatelessWidget {
  static String routeName = "/deleteAccount";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // elevation: 0,
          backgroundColor: Colors.grey[800],
          title: Text(
            "Delete account",
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
          child: DeletePage(),
        ));
  }
}
