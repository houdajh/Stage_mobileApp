import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/account/account_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import 'profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.pushNamed(context, AccountScreen.routeName)
            },
          ),
          
          
          
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
