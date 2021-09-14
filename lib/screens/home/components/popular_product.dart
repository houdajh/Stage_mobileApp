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
          demoProducts=[];
          snapshot.data.docs.forEach((element) {
            demoProducts.add(
                Product(id: element.id.toString(),
                images: element["images"],
                colors: [],
                categorieId: element["categorieId"],
                title: element["titre"],
                oldPrice: element.data()['oldPrix'],
                price: element["prix"],
                description: element["description"]));

            //print("****************");
            //print(element.data()['oldPrix'].toDouble());
          });
          return Column(
            children: [
              Padding(
                padding:
                EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(title: "Products", press: () {}),
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