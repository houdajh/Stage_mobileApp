import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 400,
    this.height: 585,
    this.aspectRetio = 2.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio,height;
  final Product product;

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
                          Positioned(
                              bottom: 35,
                              right: -20,
                              child: MaterialButton(
                                color: Colors.white,
                                shape: CircleBorder(),
                                onPressed: (){

                                },
                                child: Icon(Icons.favorite_border,color:Colors.red[400]),)),//botton like
                          Container(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("DISCOUNT",style: TextStyle(color: Colors.white),),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                // Text(
                //   product.title,
                //   style: TextStyle(color: Colors.black),
                //   maxLines: 2,
                // ),
                // Text(
                //   "\$${product.price}",
                //   style: TextStyle(
                //     fontSize: getProportionateScreenWidth(18),
                //     fontWeight: FontWeight.w600,
                //     color: kPrimaryColor,
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(50),
                //   onTap: () {},
                //   child: Container(
                //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                //     height: getProportionateScreenWidth(28),
                //     width: getProportionateScreenWidth(28),
                //     decoration: BoxDecoration(
                //       color: product.isFavourite
                //           ? kPrimaryColor.withOpacity(0.15)
                //           : kSecondaryColor.withOpacity(0.1),
                //       shape: BoxShape.circle,
                //     ),
                //     child: SvgPicture.asset(
                //       "assets/icons/Heart Icon_2.svg",
                //       color: product.isFavourite
                //           ? Color(0xFFFF4848)
                //           : Color(0xFFDBDEE4),
                //     ),
                //   ),
                // ),
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
                            Text(product.price.toString(),style: TextStyle(color: Colors.grey,fontSize: 15,
                                decoration: TextDecoration.lineThrough),),
                          ],
                        ),//le prix old and new
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 10),
                          child: Text(product.description,style: TextStyle(fontSize:  15.0,fontWeight: FontWeight.w300,fontStyle:FontStyle.italic,height: 1.5,),maxLines: 5,
                            overflow: TextOverflow.ellipsis,),
                        ),
                        Container(

                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star,color: Colors.red,size: 15,),
                                    Icon(Icons.star,color: Colors.red,size: 15,),
                                    Icon(Icons.star,color: Colors.red,size: 15,),
                                    Icon(Icons.star,color: Colors.red,size: 15,),
                                    Icon(Icons.star_border,color: Colors.red,size: 15,)
                                  ],
                                ),
                                Text(product.oldPrice.toString()+' reviews',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey[500],
                                  ),),
                              ],
                            )),

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
