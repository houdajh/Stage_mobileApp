


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserData {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String address;


  UserData({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNumber,
    @required this.address,
    

  });

}
List<UserData>  userData = [

];

class Users with ChangeNotifier {
  List<UserData> UserDataList = [];

  getDataUsers() async{
    FirebaseFirestore.instance.collection("users").snapshots().listen((event) {
      event.docs.forEach((element) {
        UserDataList.add(UserData(
              id: element.id,
              firstName: element.data()['firstName'],
              lastName: element.data()['lastName'],
              phoneNumber: element.data()['phoneNumber'],
              address: element.data()['address'],
              
        )
        );
        // element.data()['images'].forEach((e){
        //   print(e);

            });
      });
    }
}

  


