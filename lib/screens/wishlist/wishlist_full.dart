import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class WishlistFull extends StatefulWidget {
 
  
  
  const WishlistFull();
  @override
  _WishlistFullState createState() => _WishlistFullState();
  
}

class _WishlistFullState extends State<WishlistFull> {
  Future getPosts() async{
    var firestore =FirebaseFirestore.instance;
    
    QuerySnapshot qn = await firestore.collection("likesCounter").get();
    return qn.docs;
  }
  @override
  Widget build(BuildContext context) {
   // final favsAttr = Provider.of<FavsAttr>(context);
   
  User userData=  FirebaseAuth.instance.currentUser;
   return
    FutureBuilder(
            future: getPosts(),
            // ignore: missing_return
            builder: (_,  snapshot) {
               if(snapshot.connectionState == ConnectionState.waiting){
                                   print(" ohhhhhhhhh WAIT");
                                
                               }
                       if(snapshot.hasError){

                               print("wa333333333 ERROR");    
                               }
                               else{
                                 CollectionReference postRef = FirebaseFirestore.instance.collection("produits");
                                  CollectionReference likesCountRef = FirebaseFirestore.instance.collection("likesCounter");
                                 return 
                                  Expanded(
          child: SizedBox(
            height: 200.0,
                                 child: ListView.builder(
                                   itemCount: snapshot.data.length,
                                   itemBuilder: ( _ ,index){
                                     var id;
                                     id =snapshot.data[index][userData.uid];
                                      likesCountRef.get().then((snapshot) {
      snapshot.docs.forEach((doc) {
        print(doc.data.toString());
      });
    });
    
                                 print("******************* $id");
                                      return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            //color: kTextColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network("https://wristreview.com/wp-content/uploads/2016/08/Swatch-Sistem51-Irony-Steel-1.jpg"),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "+++++++++${postRef.doc()}",
                            //favsAttr.title,
                            style: TextStyle(
                                fontSize: 16.0, 
                                fontWeight: FontWeight.bold
                                ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "\$ ${130}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 18.0,
                                color:  Color(0xFFFFECDF)
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
                                   }
                                   )
          )
                                  );
                               }
              
            },
          );
    
   
  }

  
}