import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics:NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){

              return ProductCard(product: demoProducts[index]);
            },
            itemCount: demoProducts.length,
          )
        )
      ],
    );
  }
}
