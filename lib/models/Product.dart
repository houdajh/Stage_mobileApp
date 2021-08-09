import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Product {
  final String id;
  final String title, description,categorieId;
  final List<dynamic> images;
  final List<Color> colors;
  final double oldPrice, price;
  final bool isFavourite, isPopular;

  Product( {

    @required this.id,
    @required this.images,
    @required this.colors,
    @required  this.oldPrice,
    this.isFavourite = true,
    this.isPopular = true,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.categorieId,
  });
}

// Our demo Products

List<Product>  demoProducts = [];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";



class Products with ChangeNotifier {
  List<Product> productsList = [];


  getDataProduits() async{
    FirebaseFirestore.instance.collection("produits").snapshots().listen((event) {
      event.docs.forEach((element) {
        print("****************");
        print(element.data()['oldPrix']);
        productsList.add(Product(
              id: element.id,
              title: element.data()['title'],
              description: element.data()['description'],
              price: element.data()['prix'],
              images: element.data()['images'],
              oldPrice:element.data()['oldPrix'],
              categorieId :element.data()['categorieId'],
        ));
        // element.data()['images'].forEach((e){
        //   print(e);

            });
      });
    }
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
