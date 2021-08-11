import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Categories.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  final Categorie categorie;

  const Body({Key key, @required this.categorie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    demoProducts=[];
      ListView(
      children: [
        ListView.builder(
            itemCount: demoProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(product: demoProducts[index]);
            }
        ),

      ],
    );
  }
}
