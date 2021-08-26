


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Comment {
  final String id;
  final String name;
  final String pic;
  final String message;


  Comment({
    @required this.id,
    @required this.name,
    @required this.pic,
    @required this.message,

  });
}

List<Comment>  democomment = [

];
List<Comment>  filedata = [

];

class Comments with ChangeNotifier {
  List<Comment> filedata = [];


  getDataComments() async{
    FirebaseFirestore.instance.collection("comment").snapshots().listen((event) {
      event.docs.forEach((element) {
        filedata.add(Comment(
              id: element.id.toString(),
              name: element.data()['name'],
              pic: element.data()['pic'],
              message: element.data()['message'],
              
        )
        );
        
            });
      }
      );
    }
  }