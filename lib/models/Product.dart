import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Product {
  final String id;
  final String title, description;
  final List<dynamic> images;
  final List<Color> colors;
  final double oldPrice, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.oldPrice = 0.0,
    this.isFavourite = true,
    this.isPopular = true,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product>  demoProducts = [
  Product(
    id: "1",
    images: [
      "https://wristreview.com/wp-content/uploads/2016/08/Swatch-Sistem51-Irony-Steel-1.jpg",
      "https://www.etechreviewed.com/wp-content/uploads/2020/03/best-5g-phones.jpg",
      "https://www.entreprise-paris.com/wp-content/uploads/sites/10/2018/11/luxe-produits-phares-parisiennes.jpg",
      "https://cdn.radiofrance.fr/s3/cruiser-production/2021/06/ecd19166-1f70-4acc-bf32-8ce177a87864/870x489_no_lenn.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    oldPrice: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: "2",
    images: [
      "https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2019/10/Buy-a-Kia-Telluride-Instead-gear-patrol-slide-1.jpg?crop=0.620xw:0.919xh;0.293xw,0.0813xh&resize=640:*",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    oldPrice: 4.1,
    isPopular: true,
  ),
  Product(
    id: "3",
    images: [
      "https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2019/10/Buy-a-Kia-Telluride-Instead-gear-patrol-slide-1.jpg?crop=0.620xw:0.919xh;0.293xw,0.0813xh&resize=640:*",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    oldPrice: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: "4",
    images: [
      "https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2019/10/Buy-a-Kia-Telluride-Instead-gear-patrol-slide-1.jpg?crop=0.620xw:0.919xh;0.293xw,0.0813xh&resize=640:*",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    oldPrice: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

List<Product> productsList = [];


  getDataProduits() async{
    FirebaseFirestore.instance.collection("produits").snapshots().listen((event) {
      event.docs.forEach((element) {
        productsList.add(Product(
              id: element.id,
              title: element.data()['title'],
              description: element.data()['description'],
              price: element.data()['prix'],
              images: element.data()['images'],
              oldPrice:element.data()['oldPrix'],
              colors: [
                Color(0xFFF6625E),
                Color(0xFF836DB8),
                Color(0xFFDECB9C),
                Colors.white,
              ],
        ));
        // element.data()['images'].forEach((e){
        //   print(e);

            });
      });
    }


//   Future<void> fetchData() async {
//     const url = "https://flutter-app-568d3.firebaseio.com/product.json";
//     try {
//       final http.Response res = await http.get(url);
//       final extractedData = json.decode(res.body) as Map<String, dynamic>;
//       extractedData.forEach((prodId, prodData) {
//         final prodIndex = productsList.indexWhere((element) => element.id == prodId);
//         // if (prodIndex >= 0) {
//         //   productsList[prodIndex] = Product(
//         //     id: prodId,
//         //     title: prodData['title'],
//         //     description: prodData['description'],
//         //     price: prodData['price'],
//         //     imageUrl: prodData['imageUrl'],
//         //   );
//         // } else {
//         //   productsList.add(Product(
//         //     id: prodId,
//         //     title: prodData['title'],
//         //     description: prodData['description'],
//         //     price: prodData['price'],
//         //     imageUrl: prodData['imageUrl'],
//         //   ));
//         // }
//       });
//       //notifyListeners();
//     } catch (error) {
//       throw error;
//     }
//   }
//
// }
