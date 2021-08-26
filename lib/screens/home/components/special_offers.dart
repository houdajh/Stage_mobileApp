import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/categories_card.dart';
import 'package:shop_app/models/Categories.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
    Categorie categorie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("categorie").snapshots(),
        builder:
            (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.red,));
          }
          demoCategories=[];
          snapshot.data.docs.forEach((element) {
            demoCategories.add(
                Categorie(id: element.id.toString(),
                  image: element["image"],
                  title: element["titre"],));
          });
          return Column(
            children: [
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(
                  title: "Categories",
                  press: () {},
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 120,
                  child:
                  ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return SpecialOfferCard(

                          categorie: demoCategories[index],
                        );
                      },
                      separatorBuilder: (context,index)=>SizedBox(width: 0,),
                      itemCount: demoCategories.length),
                ),

              ),
            ],
          );
        }
    );
  }
}
