import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductSearchCard extends StatelessWidget {
  const ProductSearchCard({
    Key key,
    this.width = 100,
    this.height: 100,
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
         height: 100,
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
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.02,
                      child: Container(
                        child: Hero(
                          tag: product.id.toString(),
                          child:Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [

                              Column(
                                children: [
                                  Image(image: NetworkImage(product.images[0]),fit: BoxFit.cover,width: 100,height: 100,),
                                ],
                              ),
                          //botton like
                              Container(
                                width: 100,
                                  color: Colors.redAccent.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text("DISCOUNT",style: TextStyle(color: Colors.white,fontSize: 11),textAlign: TextAlign.center,),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
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

                          ),


                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 2,
                    right: -15,
                    child: MaterialButton(
                      color: Colors.white,
                      shape: CircleBorder(),
                      onPressed: (){

                      },
                      child: Icon(Icons.favorite_border,color:Colors.red[400]),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
