import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // elevation: 0,
        backgroundColor: Colors.grey[350],
        title: Text("Sign In",
         style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:Stack(
        children :[
          Positioned.fill(child: Image.asset(
            "assets/images/back3.jpg",
            fit : BoxFit.cover,
            color: Colors.black12,
            colorBlendMode: BlendMode.darken,

          )),
          Body(),
        ] 
          
        )
      
    );
  }
}
