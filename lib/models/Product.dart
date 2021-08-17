import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Product {
  final String id;
  final String title, description,categorieId;
  final List<dynamic> images;
  final List<Color> colors;
  final double oldPrice, price;
  final int countlikes;

  Product( {

    @required this.id,
    @required this.images,
    @required this.colors,
    @required  this.oldPrice,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.categorieId,
    this.countlikes ,
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

