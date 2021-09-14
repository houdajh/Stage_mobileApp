
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Categories.dart';

import '../../models/Product.dart';

import 'components/custom_app_bar.dart';

class CategoriesLsiteProduits extends StatelessWidget {
  static String routeName = "/CategoriesLsiteProduits";

  @override
  Widget build(BuildContext context) {
    final ProductCategoriesArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(),
      body: 
      Container(
        child: SingleChildScrollView(
          child: StreamBuilder(
              // where('categorieId', isEqualTo: agrs.categorie.id)
              stream: FirebaseFirestore.instance.collection("produits").snapshots(),
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(color: Colors.red,));
                }
                demoCateg=[];
                snapshot.data.docs.forEach((element) {
                  print("*************");
                  print(element["categorieId"]);
                  print((agrs.categorie.id).toString());
                  if(element['categorieId']== (agrs.categorie.id).toString()){
                    print("--------------->>>>>>");
                    print(element["categorieId"]);
                    print("=====>>>>>>");
                  //  print(agrs.categorie.id);
                          demoCateg.add(
                              Product(id: element.id.toString(),
                                  images: element["images"],
                                  colors: [],
                                  categorieId: element["categorieId"],
                                  title: element["titre"],
                                  countlikes: element["countlikes"],
                                  oldPrice: element.data()['oldPrix'],
                                  price: element["prix"],
                                  description: element["description"]));
                  }

                      });
                return Column(
                  children: [
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ProductCard(product: demoCateg[index]);
                        },
                        itemCount: demoCateg.length,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class ProductCategoriesArguments {
  final Categorie categorie;

  ProductCategoriesArguments({@required this.categorie});
}
