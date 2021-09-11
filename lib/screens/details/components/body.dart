import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/redButton.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/form_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:like_button/like_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'product_images.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';


class BodyScreen extends StatefulWidget {
  final Product product;
  BodyScreen({Key key, @required this.product}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreen(product: this.product);
}

class _BodyScreen extends State<BodyScreen> {
  final Product product;
  var resultCount;
  final _auth = FirebaseAuth.instance;
  var like =0;
  List<int> ListID = [];

  User userData = FirebaseAuth.instance.currentUser;

  CollectionReference usersRef = FirebaseFirestore.instance.collection("users");
  CollectionReference postRef =
      FirebaseFirestore.instance.collection("produits");
  CollectionReference likesRef = FirebaseFirestore.instance.collection("likes");
  CollectionReference likesCounterRef =
      FirebaseFirestore.instance.collection("likesCounter");

 
  

  _BodyScreen({Key key, @required this.product});


  

  Future<bool> onLikeButtonTapped(bool isLiked) async {
     if(!isLiked){
       
       likesCounterRef
        .doc(product.id)
        .set(
          {
            userData.uid: !isLiked,
          },
          SetOptions(merge: true),
        )
        .then((value) => print("likesCounter")
            )
        .catchError((error) => print("Failed to modify like : $error"));
     }else{
       
       likesCounterRef
        .doc(product.id)
        .set(
          {
            userData.uid: FieldValue.delete(),
          },
          SetOptions(merge: true),
        )
        .then((value) => print("likesCounter")
            )
        .catchError((error) => print("Failed to modify like : $error"));
     }
          

        

    likesRef
        .doc(userData.uid)
        .set(
          {
            product.id: !isLiked,
          },
          SetOptions(merge: true),
        )
        .then((value) => print("object")
            )
        .catchError((error) => print("Failed to modify like : $error"));

        
    
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FirebaseFirestore.instance
        .collection('likesCounter')
        .doc(product.id)
        .get()
        .then((value) {
      postRef
          .doc(product.id)
          .set(
            {
              "countlikes": value.data().length,
            },
            SetOptions(merge: true),
          )
          .then((value) => print("countlikes")
              )
          .catchError((error) => print("Failed to modify like : $error"));
         like =value.data().length;
         print(ListID[0]);
          

    });
    
    

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          ProductImages(product: product),
          // Icon(Icons.favorite, color: Colors.black , size: 80.0 ),
          
                          ImageSlideshow(
                        //Image.asset(product.images[0]),
                        width: double.infinity,
                        height: 372,
                        initialPage: 0,
                        indicatorColor:product.images.length > 1?Colors.redAccent : Colors.grey[100],
                        indicatorBackgroundColor: Colors.grey,
                        children: [
                          for ( var e in product.images )
                            Container(

                              child: Column(
                                children: [
                                  Image(image: NetworkImage(e),fit: BoxFit.cover,width: double.infinity,height: 350,),
                                  Container(color: Colors.white,)
                                ],
                              ),
                            ),
                        ],

                      ),
          Container(
              width: double.infinity,
              height: size.height * 0.5,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
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
              )),
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
                          color: Color(0xFFFF4848),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: getProportionateScreenWidth(64),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: LikeButton(
                        onTap: onLikeButtonTapped,
                        likeBuilder: (bool isLiked) {
                          
                            return
            FutureBuilder(
               future: likesRef.get(),
                      // ignore: missing_return
                      builder: (context ,snapshot){
                        
                          FirebaseFirestore
                            .instance
                            .collection('likes')
                           .doc(userData.uid)
                           .get()
                           .then(
          (value) {
             isLiked = value.data()[product.id]; 
             }
             );
             
             FirebaseFirestore.instance
    .collection('likesCounter')
    .doc(product.id)
    .get()
    .then((value) {
      postRef.doc(product.id)
      .set(
        {"countlikes" : value.data().length,}
        ,SetOptions(merge : true),)
      .then((value) => print("countlikes")
      ) .catchError((error) => print("Failed to modify like : $error"));
      
      
      // Access your after your get the data
    
     });
     if(isLiked ==null){
       return Icon(
                            Icons.favorite,
                            color:Colors.grey,
                            size: 30,
                          );
     }
     
               return Icon(
                            Icons.favorite,
                            color: isLiked 
                                ? Colors.red
                                : Colors.grey,
                            size: 30,
                          );
             
                      }
            
            );
                   
        
                        },
            //  likeCount: like,
              
               // countBuilder: (int count, bool isLiked, String text) {
               //   print(like);
         //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
          //  Widget result;
          //  if (count == 0) {
           //   result = Text(
           //     "love",
            //    style: TextStyle(color: Colors.black),
            //  );
          ////  } else
            //  result = Text(
             //   text,
            //  /  style: TextStyle(
              //    color: Colors.black,
                //  fontSize: 30,
                //  ),
              //);
           // return result;
         // },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    maxLines: 2,
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
                          Row(
                            children: [
                              Text(
                                "\$" + product.price.toString(),
                                style: TextStyle(
                                    color: Colors.red[500],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                product.oldPrice.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ), //le prix old and new
                          //Text(
                          //  " likes: ${like}",
                         //   style: TextStyle(
                            ////    fontSize: 16, fontWeight: FontWeight.bold),
                        //  ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: getProportionateScreenWidth(64),
                      height: getProportionateScreenWidth(64),
                    //  decoration: BoxDecoration(
                    //    color: Color(0xFFFFE6E6),
                     //   borderRadius: BorderRadius.only(
                      //    topLeft: Radius.circular(20),
                       //   bottomLeft: Radius.circular(20),
                       // ),
                     // ),
                     // child: IconButton(
                     //   icon: SvgPicture.asset(
                        //  "assets/icons/Conversation.svg",
                       //   color: Color(0xFFFF4848),
                       //   height: getProportionateScreenWidth(16),
                      //  ),
                     //   onPressed: () {
                         // Navigator.push(
                          //  context,
                          //  MaterialPageRoute(builder: (context) => TestMe()),
                         // );
                        //},
                      //),
                    ),
                  ),
                  RedButton(
                    text: 'ORDER',
                    press: () {
                      // A MaterialPageRoute is a  modal route that replaces the entire screen
                      // with a platform-adaptive transition.
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) => new FormScreen(
                            value: Product(
                          id: product.id,
                          title: product.title,
                        )),
                      );
                      Navigator.of(context).push(route);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  
}
