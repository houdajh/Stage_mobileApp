import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:flutter/src/material/icon_button.dart';
import 'package:shop_app/models/comm.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'product_description.dart';

import 'package:comment_box/comment/comment.dart';



class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {


  
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  CollectionReference commRef =
                  FirebaseFirestore.instance.collection("comment");
   User userData=  FirebaseAuth.instance.currentUser;
     CollectionReference usersRef = 
                  FirebaseFirestore.instance.collection("users");


   final Product product;
    
  List filedata = [
    {
      'name': "houda",
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  _TestMeState({Key key, @required this.product });

  Widget commentChild(data) {
    
    //body:
     FutureBuilder<DocumentSnapshot>(
       future: commRef.doc(userData.uid).get(),
     builder:
        // ignore: missing_return
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }
        filedata = [];
           if (snapshot.connectionState == ConnectionState.done) {
         // Map<String, dynamic> dataa = snapshot.data.data() as Map<String, dynamic>;
          filedata.add({
               // Comment(
              //id: element.id,
              'name': data['name'],
              'pic': data['pic'],
              'message': data['message'],
          }
       // )
                );
                 commRef.doc(userData.uid).get().then((DocumentSnapshot doc) =>
             filedata.add({doc.data})
            
                 );
         
        }
              
          
                
          }
     );
          return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                  
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.grey,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
          
        }
    
    
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Comment Page",
           style: TextStyle(
    color: Colors.white,
  ),
          ),
        backgroundColor: Colors.grey[850],
        
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState.validate()) {
              print(commentController.text);
              //commRef.doc(userData.uid).get().then((DocumentSnapshot doc) =>
            // print(democomment[0]),
            // );

              setState(() {
                //commRef.doc(userData.uid).update({"message": []});
               //  commRef.doc(userData.uid).update({
              //  "message": FieldValue.arrayUnion([commentController.text]),
                
            //  });

                var value = {
                  'name': 'New User',
                  'pic':
                      'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}