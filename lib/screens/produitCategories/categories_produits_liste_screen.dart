
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Categories.dart';
import 'package:shop_app/screens/home/components/section_title.dart';

import '../../models/Product.dart';
import '../../size_config.dart';
import 'components/body.dart';
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
      body: //Body(categorie: agrs.categorie),
      // ListView.builder(
      //     itemCount: demoProducts.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       print("#############################");
      //       print(agrs.categorie.title);
      //       return ProductCard(product: demoProducts[index]);
      //     }
      // ),
      Container(
        child: SingleChildScrollView(
          child: StreamBuilder(
              // where('categorieId', isEqualTo: agrs.categorie.id)
              stream: FirebaseFirestore.instance.collection("produits").snapshots(),
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(color: Colors.red,));
                }
                demoProducts=[];
                snapshot.data.docs.forEach((element) {
                  if(element['categorieId']==agrs.categorie.id){
                    print("--------------->>>>>>");
                    print(element["categorieId"]);
                    print("=====>>>>>>");
                    print(agrs.categorie.id);
                          demoProducts.add(
                              Product(id: element.id.toString(),
                                  images: element["images"],
                                  colors: [],
                                  categorieId: element["categorieId"],
                                  title: element["titre"],
                                  oldPrice: element.data()['oldPrix'].toDouble(),
                                  price: element["prix"].toDouble(),
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
                          return ProductCard(product: demoProducts[index]);
                        },
                        itemCount: demoProducts.length,
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
