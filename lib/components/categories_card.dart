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



