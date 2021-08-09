import 'package:flutter/material.dart';
import 'package:shop_app/models/Categories.dart';
import 'package:shop_app/screens/produitCategories/categories_produits_liste_screen.dart';

import '../size_config.dart';
class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    this.categorie,
  }) : super(key: key);

  final Categorie categorie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
    child: GestureDetector(// hadi bax ndoz la page detail
          onTap: () => Navigator.pushNamed(
            context,
            CategoriesLsiteProduits.routeName,
            arguments: ProductCategoriesArguments(categorie: categorie),
          ),
        child: SizedBox(
          width: 220,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Hero(
                  tag: categorie.id.toString(),
                  child: Image(image: NetworkImage(categorie.image),
                    width: 270,height: 120,fit: BoxFit.cover,),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: categorie.title,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:shop_app/models/Categories.dart';
// import 'package:shop_app/screens/details/details_screen.dart';
// import 'package:shop_app/screens/produitCategories/categories_produits_liste_screen.dart';
//
// import '../size_config.dart';
// class SpecialOfferCard extends StatelessWidget {
//   const SpecialOfferCard({
//     Key key,
//     @required this.categorie,
//   }) : super(key: key);
//
//   final Categorie categorie;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left:15),
//       child: Container(
//         // height: 580,
//         child: GestureDetector(// hadi bax ndoz la page detail
//           onTap: () => Navigator.pushNamed(
//             context,
//             CategoriesLsiteProduits.routeName,
//             arguments: ProductCategoriesArguments(categorie: categorie),
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 // borderRadius: BorderRadius.circular(18),
//                 boxShadow: [BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 8.0,
//                   offset: Offset(0,1),
//                   spreadRadius: 1.2,
//                 )]
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AspectRatio(
//                   aspectRatio: 1.02,
//                   child: Container(
//                     child: Hero(
//                       tag: categorie.id.toString(),
//                       child:SizedBox(
//                         width: 220,
//                         height: 120,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Stack(
//                             children: [
//                               Image(image: NetworkImage(categorie.image),
//                                 width: 270,height: 120,fit: BoxFit.cover,),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter,
//                                     colors: [
//                                       Color(0xFF343434).withOpacity(0.4),
//                                       Color(0xFF343434).withOpacity(0.15),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: getProportionateScreenWidth(15.0),
//                                   vertical: getProportionateScreenWidth(10),
//                                 ),
//                                 child: Text.rich(
//                                   TextSpan(
//                                     style: TextStyle(color: Colors.white),
//                                     children: [
//                                       TextSpan(
//                                         text: categorie.title,
//                                         style: TextStyle(
//                                           fontSize: getProportionateScreenWidth(18),
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                     ),
//                   ),
//                 ),
//                 // Container(
//                 //   transform: Matrix4.translationValues(0.0, -15.0, 0.0),
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.only(left: 8.0),
//                 //     child: Column(
//                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                 //       children: [
//                 //         Text(product.title,style: TextStyle(fontWeight:FontWeight.bold,fontSize:  20.0,color: Colors.black,),maxLines: 2,
//                 //         ),
//                 //         Row(
//                 //           children: [
//                 //             Text("\$"+product.price.toString(),style: TextStyle(color: Colors.red[500],fontWeight: FontWeight.bold,fontSize: 20),),
//                 //             SizedBox(width: 8,),
//                 //             Text(product.price.toString(),style: TextStyle(color: Colors.grey,fontSize: 15,
//                 //                 decoration: TextDecoration.lineThrough),),
//                 //           ],
//                 //         ),//le prix old and new
//                 //         Padding(
//                 //           padding: const EdgeInsets.only(top: 8.0,bottom: 10),
//                 //           child: Text(product.description,style: TextStyle(fontSize:  15.0,fontWeight: FontWeight.w300,fontStyle:FontStyle.italic,height: 1.5,),maxLines: 5,
//                 //             overflow: TextOverflow.ellipsis,),
//                 //         ),
//                 //         Container(
//                 //
//                 //             child: Row(
//                 //               children: [
//                 //                 Row(
//                 //                   children: [
//                 //                     Icon(Icons.star,color: Colors.red,size: 15,),
//                 //                     Icon(Icons.star,color: Colors.red,size: 15,),
//                 //                     Icon(Icons.star,color: Colors.red,size: 15,),
//                 //                     Icon(Icons.star,color: Colors.red,size: 15,),
//                 //                     Icon(Icons.star_border,color: Colors.red,size: 15,)
//                 //                   ],
//                 //                 ),
//                 //                 Text(product.oldPrice.toString()+' reviews',
//                 //                   style: TextStyle(
//                 //                     fontSize: 15,
//                 //                     fontWeight: FontWeight.w900,
//                 //                     color: Colors.grey[500],
//                 //                   ),),
//                 //               ],
//                 //             )),
//                 //
//                 //       ],
//                 //     ),
//                 //   ),
//                 // )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//

