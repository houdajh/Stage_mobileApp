import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Sign Up" ,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Colors.red ,
              Colors.grey[800],
              Colors.white,
              Colors.white,
             
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
         child: Body(),
        )
    );
  }
}
