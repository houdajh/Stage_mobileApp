import 'package:flutter/material.dart';
import 'package:shop_app/components/categories_card.dart';
import 'package:shop_app/models/Categories.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Special for you",
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
                    image: demoCategories[index].image,
                    category: demoCategories[index].title,
                    numOfBrands: 18,
                    press: () {},
                  );
                },
                separatorBuilder: (context,index)=>SizedBox(width: 0,),
                itemCount: demoCategories.length),
          ),





          // SingleChildScrollView(
          //     child: ListView.builder(
          //       scrollDirection: Axis.vertical,
          //       shrinkWrap: true,
          //       physics:NeverScrollableScrollPhysics(),
          //       itemBuilder: (context,index){
          //
          //         return
          //       },
          //       itemCount: 3,
          //     )
          // )






          // Row(
          //   children: [
          //
          //     SpecialOfferCard(
          //       image: "assets/images/Image Banner 3.png",
          //       category: "Fashion",
          //       numOfBrands: 24,
          //       press: () {},
          //     ),
          //     SizedBox(width: getProportionateScreenWidth(20)),
          //   ],
          // ),
        ),
      ],
    );
  }
}
