import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
   ProductCard({
    Key key,
    this.width = 400,
    this.height: 585,
    this.aspectRetio = 2.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio,height;
  final Product product;
  CollectionReference usersRef =
                  FirebaseFirestore.instance.collection("users");
 CollectionReference postRef = FirebaseFirestore.instance.collection("produits");
             

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        // height: 580,
        child: GestureDetector(// hadi bax ndoz la page detail
          onTap: () => Navigator.pushNamed(
            context,
            DetailPage.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                // borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8.0,
                  offset: Offset(0,1),
                  spreadRadius: 1.2,
                )]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    child: Hero(
                      tag: product.id.toString(),
                      child:Stack(
                        children: [

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
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("\$"+product.price.toString(),style: TextStyle(color: Colors.white),),
                               
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text(product.title,style: TextStyle(fontWeight:FontWeight.bold,fontSize:  20.0,color: Colors.black,),maxLines: 2,
                        ),
                        Row(
                          children: [
                            Text("\$"+product.price.toString(),style: TextStyle(color: Colors.red[500],fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 8,),
                            Text(product.oldPrice.toString(),style: TextStyle(color: Colors.grey,fontSize: 15,
                                decoration: TextDecoration.lineThrough),),
                          ],
                        ),//le prix old and new
                       // Padding(
                         // padding: const EdgeInsets.only(top: 8.0,bottom: 10),
                         // child: Text(product.description,style: TextStyle(fontSize:  15.0,fontWeight: FontWeight.w300,fontStyle:FontStyle.italic,height: 1.5,),maxLines: 5,
                          //  overflow: TextOverflow.ellipsis,),
                      //  ),
                       

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
