
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/details/components/form_screen.dart';
import 'package:shop_app/screens/details/components/order.dart';
//import 'package:shop_app/models/user.dart';
import 'package:shop_app/size_config.dart';
import 'package:like_button/like_button.dart';
import 'color_dots.dart';
import 'comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;
  final _auth = FirebaseAuth.instance;
  List<String>  ListID = [];
  
 
  User userData=  FirebaseAuth.instance.currentUser;
  
  CollectionReference usersRef = 
                  FirebaseFirestore.instance.collection("users");
 CollectionReference postRef = FirebaseFirestore.instance.collection("produits");
 CollectionReference likesRef =
                  FirebaseFirestore.instance.collection("likes");

                  CollectionReference likesCounterRef =
                  FirebaseFirestore.instance.collection("likesCounter");
              
             
  Body({Key key, @required this.product }) : super(key: key);



  @override
  Widget build(BuildContext context) {
   // var like =FirebaseFirestore.instance.collection("likes").doc(userData.uid).collection(product.id).where(product.id );
    var size = MediaQuery.of(context).size;

    



       FirebaseFirestore.instance
    .collection('likes')
    .doc(userData.uid)
    .get()
    .then((value) {
       return value.data()['0v9uvzgNhHWl4NdbpUSX']; // Access your after your get the data
     });
    return 
        SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          ProductImages(product: product),
         // Icon(Icons.favorite, color: Colors.black , size: 80.0 ),
          Container(
            
            width: double.infinity,
            height: size.height * 0.5,
            
           
           
             child: SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              //height: getProportionateScreenWidth(30),
              width: getProportionateScreenWidth(30),
              child: Align(
                      alignment: Alignment.topRight,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                color: Colors.white,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 15,
                ),
              ),
              ),
            ),
            Spacer(),
            Container(
              child: SizedBox(
               child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
                       child: Row(
                children: [
                  
                  const SizedBox(width: 5),
                  
                  
                ],
                ),
              
              ),
            ),
            ),
            )
          ],
        ),
      ),
    )
          ),
          Container(
            
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                           color: Color(0xFFFF4848) ,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: Color(0xFFFFE6E6) ,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
           // child: SvgPicture.asset(
             // "assets/icons/Heart Icon_2.svg",
             // color: Color(0xFFFF4848) ,
             // height: getProportionateScreenWidth(16),
           // ),
           
           
            child: LikeButton(
              size: 30,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
            
          ),
          likeBuilder: (bool isLiked) {

              
            return
            FutureBuilder(
              
                     future: likesRef.get(),
                      // ignore: missing_return
                      builder: (context ,snapshot){

                        var likes;
                        FirebaseFirestore.instance
    .collection('produits')
    .doc(product.id)
    .get()
    .then((value) {
      likes=value.data()["countlikes"];
      print("yabsmlah $likes" ) ;// Access your after your get the data
     });



                         var fav =  FirebaseFirestore.instance
    .collection('likes')
    .doc(userData.uid)
    .get()
    .then((value) {
      isLiked=value.data()[product.id];
      print(value.data()[product.id] ) ;// Access your after your get the data
     });

    
    
    
      FirebaseFirestore.instance
    .collection('likesCounter')
    .doc(product.id)
    .get()
    .then((value) {
      postRef.doc(product.id).set(
                                          {
                                          "countlikes" : value.data().length,
                                          
                                        },SetOptions(merge : true),
                                          
                                        ).then((value) => print("countlikes")
                                     //  ListID.add(userData.uid)
                                        ) .catchError((error) => print("Failed to modify like : $error"));
      
      print("voila: ${value.data().length}" ) ;// Access your after your get the data
    
     });
     
     
     if(isLiked ){
       
                       if(snapshot.connectionState == ConnectionState.waiting){
                                   print("WAIT");
                                
                                  // print(likesRef.doc(userData.uid).firestore.collection(product.id).where(product.id));
                                }
                       if(snapshot.hasError){

                               print("ERROR");    
                               }
                        if(snapshot.hasData   ){
                         
                          

                        likesCounterRef.doc(product.id).set(
                                          {
                                          userData.uid : true,
                                          "uid" : product.id,
                                          
                                        },SetOptions(merge : true),
                                          
                                        ).then((value) => print("likesCounter")
                                     //  ListID.add(userData.uid)
                                        ) .catchError((error) => print("Failed to modify like : $error"));
                                
                                        likesRef.doc(userData.uid).set(
                                          {
                                          product.id : true,
                                          
                                        },SetOptions(merge : true),
                                          
                                        ).then((value) => print("object")
                                     //  ListID.add(userData.uid)
                                        ) .catchError((error) => print("Failed to modify like : $error"));
                              return  Icon(
                                Icons.favorite,
                                 color: Colors.red,
                                size: 30,
                              );
                      //  }
           // );
                                  }  
                              }
                         else{
                            if(snapshot.connectionState == ConnectionState.waiting){
                                   print("WAIT");
                                
                                  // print(likesRef.doc(userData.uid).firestore.collection(product.id).where(product.id));
                                }
                       if(snapshot.hasError){

                               print("ERROR");    
                               }
                          if(snapshot.hasData  ){
                                      //  if(FirebaseFirestore.instance.collection("likes").doc(userData.uid).collection(product.id) == false ){
                                   
                                          likesCounterRef.doc(product.id).set(
                                          {
                                          userData.uid : FieldValue.delete(),
                                          
                                        },SetOptions(merge : true),
                                          
                                        ).then((value) => print("likesCounter")
                                     //  ListID.add(userData.uid)
                                        ) .catchError((error) => print("Failed to modify like : $error"));
                                
                                
                                    likesRef.doc(userData.uid).update(
                                          {
                                          product.id : false,
                                          
                                        },//SetOptions(merge : true),
                                          
                                        ).then((value) => isLiked=false);
                                        return  Icon(
                                Icons.favorite,
                                 color: Colors.grey,
                                size: 30,
                              );
                            
                                     
                              }
                              else{
                                 return  Icon(
                                Icons.favorite,
                                 color: Colors.grey,
                                size: 30,
                              );

                              }
                              
                      }
                                  }
                                 
                            );
            
          },
                                          ),
                                                                 
                                                                              ),
                                                                              
                                                                            ),
                                                                            
                                                                        SizedBox(
                                                                          height: 20,
                                                                        ),
                                                      
                                                      
                                                                        Text(product.title,style: TextStyle(fontWeight:FontWeight.bold,fontSize:  20.0,color: Colors.black,),maxLines: 2,
                                                                              ),
                                                                        SizedBox(
                                                                          height: 20,
                                                                        ),
                                                                        Row(
                                                                          
                                                                          children: <Widget>[
                                                                            Container(
                                                                              width: 40,
                                                                              height: 40,
                                                                              
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: <Widget>[
                                                                                
                                                                                Text(
                                                                                  " likes: ${product.countlikes}",

                                                                                  style: TextStyle(
                                                                                      fontSize: 16, fontWeight: FontWeight.bold),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 3,
                                                                                ),
                                                                                 Text(
                                                                                  " Price: ${product.price}\t\$",
                                                                                  style: TextStyle(
                                                                                      fontSize: 16, fontWeight: FontWeight.bold),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 3,
                                                                                ),
                                                                                Text(
                                                                                  "Old Price: ${product.oldPrice}\t\$",
                                                                                  style: TextStyle(fontSize: 13),
                                                                                )
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                        SizedBox(height: 20,),
                                                            
                                                              
                                                      
                                                      
                                                                        Row(
                                                                          children: <Widget>[
                                                                           // Container(
                                                                             // decoration: BoxDecoration(
                                                                               //   border: Border.all(color: Colors.grey),
                                                                               //   borderRadius: BorderRadius.circular(3)),
                                                                             // child: Padding(
                                                                              //  padding: const EdgeInsets.all(6.0),
                                                                              //  child: Text("Interior"),
                                                                             // ),
                                                                           // ),
                                                                            SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                           // Container(
                                                                             // decoration: BoxDecoration(
                                                                                //  border: Border.all(color: Colors.grey),
                                                                                //  borderRadius: BorderRadius.circular(3)),
                                                                              //child: Padding(
                                                                              //  padding: const EdgeInsets.all(6.0),
                                                                              //  child: Text("40m2"),
                                                                             // ),
                                                                          //  ),
                                                                             SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                           // Container(
                                                                             // decoration: BoxDecoration(
                                                                                 // border: Border.all(color: Colors.grey),
                                                                                //  borderRadius: BorderRadius.circular(3)),
                                                                              //child: Padding(
                                                                              //  padding: const EdgeInsets.all(6.0),
                                                                              //  child: Text("Ideas"),
                                                                             // ),
                                                                           // )
                                                                          ],
                                                                        ),
                                                                        SizedBox(height: 20,),
                                                                        Text(product.description,style: TextStyle(fontSize:  15.0,fontWeight: FontWeight.w300,fontStyle:FontStyle.italic,height: 1.5,),maxLines: 5,
                                                                                  overflow: TextOverflow.ellipsis,),
                                                                                           
                                                       Align(
                                                                alignment: Alignment.centerRight,
                                                                child:Container(
                                                                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                                                                  width: getProportionateScreenWidth(64),
                                                                  height: getProportionateScreenWidth(64),
                                                                  decoration: BoxDecoration(
                                                                    color: Color(0xFFFFE6E6),
                                                                    borderRadius: BorderRadius.only(
                                                                      topLeft: Radius.circular(20),
                                                                      bottomLeft: Radius.circular(20),
                                                                    ),
                                                                  ),  
                                                                  
                                                                  child:  IconButton(
                                                                  icon:SvgPicture.asset(
                                                                    "assets/icons/Conversation.svg",
                                                                    color: Color(0xFFFF4848) ,
                                                                    height: getProportionateScreenWidth(16),
                                                                  ), 
                                                      
                                                      
                                                      
                                                      
                                                                  onPressed: () {
                                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => TestMe()),
                                                        );
                                                      
                                                                    },
                                                                  ), 
                                                                  ),  
                                                                   ), 
                                                                   DefaultButton(
                                                                    text :'ORDER',
                
                press: () {
                  // A MaterialPageRoute is a  modal route that replaces the entire screen
                  // with a platform-adaptive transition.
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new FormScreen(
                          value: Product(
                            id: product.id, 
                            title: product.title,
                          )
                                  ),
                  );
                  Navigator.of(context).push(route);
                },
                
              ),
                                                                     //  DefaultButton(
                                                                             //   text: "order",
                                                                                
                                                                           //    press: () => Navigator.pushNamed(context, Order.routeName),
                                                                               
                                                                            //  ),
                                                                        
                                                                       
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        }
                                                      
                                                      
                                                  
                                                  
                
}