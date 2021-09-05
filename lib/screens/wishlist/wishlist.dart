

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/custom_app_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../../enums.dart';

class wishlist extends StatelessWidget {
  static String routeName = "/wish";
  
  CollectionReference usersRef = 
                  FirebaseFirestore.instance.collection("users");
 CollectionReference postRef = FirebaseFirestore.instance.collection("produits");
 CollectionReference likesRef =
                  FirebaseFirestore.instance.collection("likes");

                  CollectionReference likesCounterRef =
                  FirebaseFirestore.instance.collection("likesCounter");
  var uid ;
  var idlike;
  var userlike ;
  var elemId;
  var x;
  
  User userData=  FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    
                        
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(),
      body: 
      Container(
        child: SingleChildScrollView(
          
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("produits").snapshots(),
              builder: (context, snapshot) {
               
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("waittt wish");
                }
                if(snapshot.hasData){
                  FirebaseFirestore.instance
                      .collection('likes')
                      .doc(userData.uid)
                      .get()
                      .then((value) {
                        demoProducts=[];
                          snapshot.data.docs.forEach((element) {
                        
                              elemId = element.id.toString();
                              
                          
                          if(value.data()[element.id.toString()]){
                            print("salam");
                            demoProducts.add(
                              Product(id: element.id.toString(),
                                  images: element["images"],
                                  colors: [],
                                  categorieId: element["categorieId"],
                                  title: element["titre"],
                                  countlikes: element["countlikes"],
                                  oldPrice: element.data()['oldPrix'].toDouble(),
                                  price: element["prix"].toDouble(),
                                  description: element["description"])
                                  ); 
                                  print("tol dyal demo f if ${demoProducts.length}");
                          }
                          print("tol dyal demo ${demoProducts.length}");
                        
                      });
                        
                        }
                        );
                }
                
                
                 
               
               
                return Column(
                  children: [
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          print("ee ${demoProducts.length}");
                          return ProductCard(product: demoProducts[index]);
                        },
                        itemCount: demoProducts.length,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu:MenuState.favourite )
    );
    
  }
}