import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("produits").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.red,));
          }
          // var docs=snapshot.data();
          
          demoProducts=[];
          snapshot.data.docs.forEach((element) {
            demoProducts.add(
                Product(
                id: element.id.toString(),
                images: element["images"],
                colors: [],
                title: element["titre"],
                price: element["prix"].toDouble(),
                description: element["description"],
                countlikes:element.data()['countlikes']
                )
                );
          }
          );
         
          print("@@@@@@@@@@@@@@@@@@@@@@");
          return Column(
            children: [
              Padding(
                padding:
                EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(title: "Popular Products", press: () {}),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProductCard(product: demoProducts[index]);
                  },
                  itemCount: demoProducts.length,
                ),
              ),
            ],
          );
        });
  }
}





















