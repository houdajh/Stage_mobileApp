import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String Lname, address, email, Fname, name, phone;

class Users {
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
}