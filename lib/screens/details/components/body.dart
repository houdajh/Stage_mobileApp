import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';
import 'package:like_button/like_button.dart';
import 'color_dots.dart';
import 'comment.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);



//ListView(
     // children: [
        //ProductImages(product: product),



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  Text(
                    "4.9",
                    style: const TextStyle(
                      color : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset("assets/icons/Star Icon.svg"),
                  
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
             // onTap: onLikeButtonTapped,
                            size: 20,
                            circleColor:
                            CircleColor(start: Colors.pink, 
                            end: Colors.pinkAccent),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Colors.red,
                              dotSecondaryColor: Colors.redAccent,
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                 Icons.favorite,
                                 color: isLiked ?
                                 Colors.red
                                : Colors.grey,
                                size: 30,
                              );
                              onPressed: (){
                                _incrementCounter();
              };
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
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(
                                                                            "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                                                                        fit: BoxFit.cover)),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Text(
                                                                    "Jean-Luis",
                                                                    style: TextStyle(
                                                                        fontSize: 16, fontWeight: FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  Text(
                                                                    "Interior Design",
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
                                                                  text: "order",
                                                                  press: () {},
                                                                ),
                                                          
                                                         
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                        
                                         Future<bool> onLikeButtonTapped(bool isLiked) async{
                                      /// send your request here
                                      // final bool success= await sendRequest();
                                      int count=0;
                                      if(isLiked == true) {
                                        count++;
                                      }
                                      print(count);
                                      /// if failed, you can do nothing
                                      // return success? !isLiked:isLiked;
                                  
                                      return !isLiked;
                                    }
                                  
                                    void _incrementCounter() {
                                      FirebaseFirestore.instance.collection("produits").snapshots();
                                      builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                              return Center(child: CircularProgressIndicator(color: Colors.red,));
                                      }
                                      snapshot.data.docs.forEach((element) {
                                         //print("iamge :");
                                         //  print(element["images"]);
                                       //demoProducts.add(
                                                // );
                                            }
                                      );
                                        };
                                         }
                                    }
                                    